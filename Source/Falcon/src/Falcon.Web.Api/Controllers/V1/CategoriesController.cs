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
using Falcon.Web.Api.Utilities.Extentions;
using Falcon.EFCommonContext;
using Falcon.Web.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class CategoriesController : FalconApiController
    {

        private readonly IDateTime mDateTime;
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;

        public CategoriesController(IDateTime dateTime , IMapper Mapper , IDbContext Database)
        {
            mDateTime = dateTime;
            mMapper = Mapper;
            mDb = Database;
        }
           

        [ResponseType(typeof(Models.Api.SCategory))]
        [Route("Categories/{UUID}")]
        [HttpGet]
        public async Task<IHttpActionResult> GetCategoryList(string UUID)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == UUID);

            if (user != null)
            {
                var categories = await mDb.Set<Category>().AsNoTracking().ToArrayAsync();
                var selectedCategory = await mDb.Set<SelectedCategory>().AsNoTracking().Where(st => st.UserID == user.ID).Select( sc => sc.CategoryID).SingleOrDefaultAsync();
                var purchasedCategories = await mDb.Set<PurchaseCategory>().AsNoTracking().Where(pt => pt.UserID == user.ID).Select(c => c.CategoryID).ToListAsync();

                if (categories.Length > 0 && selectedCategory > 0 && purchasedCategories.Count >= 0)
                {
                    var userCategories = new SCategory[categories.Length];

                    for (int i = 0; i < categories.Length; ++i)
                    {
                        userCategories[i] = new SCategory
                        {
                            ID = categories[i].ID,
                            Name = categories[i].Name,
                            ShortDescription = categories[i].ShortDescription,
                            LongDescription = categories[i].LongDescription,
                            SquareColor = categories[i].SquareColor,
                            CircleColor = categories[i].CircleColor,
                            RectangleColor = categories[i].RectangleColor,
                            Price = categories[i].Price,
                            PrizeCoefficient = categories[i].PrizeCoefficient,
                            IsPurchased = (categories[i].ID == Constants.DefaultUser.CategoryID) ? true : purchasedCategories.Contains(categories[i].ID), // TODO : remember to remove what has checked to increase checking time
                            IsActive = (selectedCategory == categories[i].ID) ? true : false
                        };
                    }

                    return Ok(userCategories);
                }

                return NotFound();
            }

            return Response(HttpStatusCode.Unauthorized);  // TODO : Replace with UnAuthorized
        }

        [ResponseType(typeof(Models.Api.SUserState))]
        [Route("Categories/Buy/{UUID}/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> BuyCategory(string UUID, int CategoryID)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == UUID);
            if (user != null)
            {
                bool bought = false;
                var category = await mDb.Set<Category>().FindAsync(CategoryID);
                var selectedCategory = await mDb.Set<SelectedCategory>().SingleOrDefaultAsync(sc => sc.UserID == user.ID);
                if (category != null)
                {
                    bool hasBought = (CategoryID == Constants.DefaultUser.AppThemeID) ? true : await mDb.Set<PurchaseCategory>().CountAsync(ph => ph.UserID == user.ID && ph.CategoryID == CategoryID) == 
                                                                    Constants.DefaultValues.PurchaseCategoryNumberAllowedToBuy;
                    if (hasBought)
                    {
                        //TODO : Log to system , unAuthorized Request
                    }
                    else
                    {
                        if (user.TotalStars - category.Price >= 0)
                        {
                            user.TotalStars -= category.Price;

                            PurchaseCategory newCategory = new PurchaseCategory
                            {
                                UserID = user.ID,
                                CategoryID = CategoryID,
                                PurchaseDate = mDateTime.Now
                            };

                            mDb.Set<PurchaseCategory>().Add(newCategory);

                            //Select as the current theme

                            bought = true;

                            selectedCategory.CategoryID = CategoryID;

                            await mDb.SaveChangesAsync();
                        }
                    }
                }

                var clientResult = new Models.Api.SUserState
                {
                    UserStar = user.TotalStars,
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
        [Route("Categories/Select/{UUID}/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> SelectCategory(string UUID, int CategoryID)
        {
            var user = await mDb.Set<User>().AsNoTracking().SingleOrDefaultAsync(u => u.UUID == UUID);
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
                            //TODO : Logging UnAuthorized Request
                        }
                    }

                    var userState = new Models.Api.SUserState
                    {
                        UserStar = user.TotalStars,
                        SelectedThemeID = null,
                        SelectedCategoryName = userSelectedCategory.Category.Name,
                        SelectedCategoryID = userSelectedCategory.CategoryID
                    };

                    return Ok(userState);
                }
                else
                {
                    return Response(HttpStatusCode.Unauthorized); // TODO : Change to UnAuthorized Request
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized); // TODO : Change with UnAuthorized
            }
        }


        [ResponseType(typeof(SCategory))]
        [Route("Categories/Purchased/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetPurchasedCategoryList(string UUID)
        {
            var userID = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if(userID != 0) // User Found
            {

                var userActiveCategories = await mDb.Set<Category>().Where(c => c.ID == Constants.DefaultUser.CategoryID ||
                                                                        mDb.Set<PurchaseCategory>().Where(pc => pc.UserID == userID)
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
            else
            {
                return ResponseMessage(Request.CreateResponse(HttpStatusCode.Unauthorized));
            }
        }


        private async Task<bool> CategoryExists(int id)
        {
            return await mDb.Set<Category>().CountAsync(e => e.ID == id) > 0;
        }
    }
}