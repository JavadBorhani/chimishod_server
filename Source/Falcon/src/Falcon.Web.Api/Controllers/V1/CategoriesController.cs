// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using System.Net.Http;
using System.Net;
using AutoMapper;
using Falcon.Web.Models.Api;
using System.Collections.Generic;
using Falcon.EFCommonContext;
using Falcon.Web.Common;
using Falcon.Common.Logging;
using log4net;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class CategoriesController : FalconApiController
    {

        private readonly IDateTime mDateTime;
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;
        private readonly ILog mLogger;
        private readonly IWebUserSession mUserSession;
        private readonly ICharacteristicsMaintenanceProcessor mCharacteristicsMaintenanceProcessor;
        private readonly ICharacteristicsInquiryProcessor mCharacteristicsInquiryProcessor;
        private readonly IUserQueryProcessor mUserQuery;
        public CategoriesController(IDateTime dateTime , 
            IMapper Mapper , 
            IDbContext Database ,
            ILogManager LogManager , 
            IWebUserSession UserSession , 
            ICharacteristicsMaintenanceProcessor CharacteristicsMaintenanceProcessor,
            ICharacteristicsInquiryProcessor CharacteristicsInquiryProcessor , 
            IUserQueryProcessor UserQuery)
        {
            mDateTime = dateTime;
            mMapper = Mapper;
            mDb = Database;
            mLogger = LogManager.GetLog(typeof(CategoriesController));
            mUserSession = UserSession;
            mCharacteristicsMaintenanceProcessor = CharacteristicsMaintenanceProcessor;
            mCharacteristicsInquiryProcessor = CharacteristicsInquiryProcessor;
            mUserQuery = UserQuery; 
        }

        public class SampleData
        {
            public IEnumerable<int> data { get; set; }
            public Category Cat { get; set; }
        }

        [ResponseType(typeof(SCategory))]
        [Route("Categories/")]
        [HttpGet]
        public async Task<IHttpActionResult> GetCategoryList()
        {
            var query = mDb.Set<Category>()
                .AsNoTracking()
                .OrderBy(c => c.ID)
                .Include(c => c.AssignedCharacters)
                .Select(c => new SampleData
                {
                    data = c.AssignedCharacters.Select(a => a.CharacterID),
                    Cat = c,
                });

            var categories = await query.ToArrayAsync(); 

            var selectedCategory = await mDb.Set<SelectedCategory>()
                .AsNoTracking()
                .Where(st => st.UserID == mUserSession.ID)
                .Select( sc => sc.CategoryID)
                .SingleOrDefaultAsync();

            var purchasedCategories = await mDb.Set<PurchaseCategory>()
                .AsNoTracking()
                .Where(pt => pt.UserID == mUserSession.ID)
                .Select(c => c.CategoryID)
                .ToListAsync();

            if (categories.Length > 0 && selectedCategory > 0 && purchasedCategories.Count >= 0)
            {
                var userCategories = new SCategory[categories.Length];

                for (int i = 0; i < categories.Length; ++i)
                {
                    userCategories[i] = new SCategory
                    {
                        ID = categories[i].Cat.ID,
                        Name = categories[i].Cat.Name,
                        ShortDescription = categories[i].Cat.ShortDescription,
                        LongDescription = categories[i].Cat.LongDescription,
                        SquareColor = categories[i].Cat.SquareColor,
                        CircleColor = categories[i].Cat.CircleColor,
                        RectangleColor = categories[i].Cat.RectangleColor,
                        Price = categories[i].Cat.Price,
                        PrizeCoefficient = categories[i].Cat.PrizeCoefficient,
                        IsPurchased = (categories[i].Cat.ID == Constants.DefaultUser.CategoryID) ? true : purchasedCategories.Contains(categories[i].Cat.ID), // TODO : remember to remove what has checked to increase checking time
                        IsActive = (selectedCategory == categories[i].Cat.ID) ? true : false,
                        DiscountAmount = categories[i].Cat.DiscountAmount,
                        TagState = categories[i].Cat.TagStateID,
                        CharacterIds = categories[i].data,
                    };
                }

                return Ok(userCategories);
            }

            return NotFound();
        }

        [ResponseType(typeof(Models.Api.SUserState))]
        [Route("Categories/Buy/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> BuyCategory(int CategoryID)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == mUserSession.UUID);
            if (user != null)
            {
                bool bought = false;
                var category = await mDb.Set<Category>().FindAsync(CategoryID);
                var selectedCategory = await mDb.Set<SelectedCategory>().SingleOrDefaultAsync(sc => sc.UserID == user.ID);
                int totalCoin;
                if (category != null)
                {
                    bool hasBought = (CategoryID == Constants.DefaultUser.AppThemeID) ? true : await mDb.Set<PurchaseCategory>().CountAsync(ph => ph.UserID == user.ID && ph.CategoryID == CategoryID) == 
                                                                    Constants.DefaultValues.PurchaseCategoryNumberAllowedToBuy;
                    if (hasBought)
                    {
                        mLogger.Error("another buy request despite user has bought it before"); 
                    }
                    else
                    {
                        if (user.TotalCoin - category.Price >= 0)
                        {
                            totalCoin = await mUserQuery.DecreaseCoin(category.Price);

                            if (totalCoin < 0)
                                throw new BusinessRuleViolationException("concurrency issue on purchase");

                            PurchaseCategory newCategory = new PurchaseCategory
                            {
                                UserID = user.ID,
                                CategoryID = CategoryID,
                                AnswerCount = 0 ,
                                PurchaseDate = mDateTime.Now
                            };

                            mDb.Set<PurchaseCategory>().Add(newCategory);

                            //Select as the current theme

                            bought = true;

                            selectedCategory.CategoryID = CategoryID;

                            await mDb.SaveChangesAsync();

                            var characters = await mCharacteristicsInquiryProcessor.GetCategoryAssignedCharacters(CategoryID);
                            var result = await mCharacteristicsMaintenanceProcessor.AddUserCharacteristicToLeaderBoard(characters , user.ID);
                            
                        }
                    }
                }

                var clientResult = new Models.Api.SUserState
                {
                    UserStar = user.TotalCoin,
                    SelectedThemeID = null,
                    SelectedCategoryID = selectedCategory.CategoryID,
                    SelectedCategoryName = selectedCategory.Category.Name,
                    Bought = bought,
                    RequestID = CategoryID,
                };
                return Ok(clientResult);
            }

            return NotFound();
        }


        [ResponseType(typeof(Models.Api.SUserState))]
        [Route("Categories/Select/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> SelectCategory(int CategoryID)
        {
            //TODO : Refactor This
            var user = await mDb.Set<User>().AsNoTracking().SingleOrDefaultAsync(u => u.UUID == mUserSession.UUID);
            if (user != null)
            {
                var userSelectedCategory = await mDb.Set<SelectedCategory>().SingleOrDefaultAsync(st => st.UserID == user.ID);

                if (await CategoryExists(CategoryID))
                {
                    if (CategoryID == Constants.DefaultUser.CategoryID) //TODO : think about changing default item Over Time :(
                    {
                        userSelectedCategory.CategoryID = CategoryID;
                        await mDb.SaveChangesAsync();
                    }
                    else
                    {
                        bool hasBoughtCategory = mDb.Set<PurchaseCategory>().AsNoTracking()
                                                        .Count(pc => pc.UserID == user.ID && pc.CategoryID == CategoryID) ==
                                                        Constants.DefaultValues.PurchaseCategoryNumberAllowedToBuy; // user has bought properly
                        if (hasBoughtCategory)
                        {
                            userSelectedCategory.CategoryID = CategoryID;
                            await mDb.SaveChangesAsync();
                        }
                        else
                        {
                            mLogger.Error("Trying to buy an item which has been purchased" + mUserSession.UUID);
                        }
                    }

                    var userState = new SUserState
                    {
                        UserStar = user.TotalCoin,
                        SelectedThemeID = null,
                        SelectedCategoryName = userSelectedCategory.Category.Name,
                        SelectedCategoryID = userSelectedCategory.CategoryID
                    };

                    return Ok(userState);
                }
                else
                {
                    return Response(HttpStatusCode.Unauthorized);
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized); 
            }
        }


        [ResponseType(typeof(SCategory))]
        [Route("Categories/Purchased")]
        [HttpPost]
        public async Task<IHttpActionResult> GetPurchasedCategoryList()
        {
            
            var userActiveCategories = await mDb.Set<Category>().Where(c => c.ID == Constants.DefaultUser.CategoryID ||
                                                                    mDb.Set<PurchaseCategory>().Where(pc => pc.UserID == mUserSession.ID)
                                                                                        .Select( pc => pc.CategoryID)
                                                                                        .ToList()
                                                                                        .Contains(c.ID))
                                                                                        .ToListAsync();
            if(userActiveCategories.Count > 0)
            {

                var result = mMapper.Map<List<Category>, List<SCategory>>(userActiveCategories);
                return Ok(result);
            }
            else
            {
                return NotFound();
            }
        }


        private async Task<bool> CategoryExists(int id)
        {
            return await mDb.Set<Category>().CountAsync(e => e.ID == id) > 0;
        }
    }
}