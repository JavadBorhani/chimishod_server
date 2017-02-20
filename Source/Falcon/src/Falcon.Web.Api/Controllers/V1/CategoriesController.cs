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

namespace Falcon.Web.Api.Controllers.V1
{
    public class CategoriesController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IDateTime mDateTime;
        private readonly IMapper mMapper;

        public CategoriesController(IDateTime dateTime , IMapper Mapper)
        {
            mDateTime = dateTime;
            mMapper = Mapper;
        }
           
        // GET: api/Categories
        public IQueryable<Category> GetCategories()
        {
            return db.Categories;
        }


        [ResponseType(typeof(Models.Api.SCategory))]
        [Route("Categories/{UUID}")]
        [HttpGet]
        public async Task<IHttpActionResult> GetCategoryList(string UUID)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);

            if (user != null)
            {
                var categories = await db.Categories.AsNoTracking().ToArrayAsync();
                var selectedCategory = await db.SelectedCategories.AsNoTracking().Where(st => st.UserID == user.ID).Select( sc => sc.CategoryID).SingleOrDefaultAsync();
                var purchasedCategories = await db.PurchaseCategories.AsNoTracking().Where(pt => pt.UserID == user.ID).Select(c => c.CategoryID).ToListAsync();

                if (categories.Length > 0 && selectedCategory > 0 && purchasedCategories.Count >= 0)
                {
                    var userCategories = new Models.Api.SCategory[categories.Length];

                    for (int i = 0; i < categories.Length; ++i)
                    {
                        userCategories[i] = new Models.Api.SCategory
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

            return NotFound();  // TODO : Replace with UnAuthorized
        }

        [ResponseType(typeof(Models.Api.SUserState))]
        [Route("Categories/Buy/{UUID}/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> BuyCategory(string UUID, int CategoryID)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            if (user != null)
            {
                bool bought = false;
                var category = await db.Categories.FindAsync(CategoryID);
                var selectedCategory = await db.SelectedCategories.SingleOrDefaultAsync(sc => sc.UserID == user.ID);
                if (category != null)
                {
                    bool hasBought = (CategoryID == Constants.DefaultUser.AppThemeID) ? true : db.PurchaseCategories.Count(ph => ph.UserID == user.ID && ph.CategoryID == CategoryID) == 
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
                            
                            db.PurchaseCategories.Add(newCategory);

                            //Select as the current theme

                            bought = true;

                            selectedCategory.CategoryID = CategoryID;

                            await db.SaveChangesAsync();
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
            var user = await db.Users.AsNoTracking().SingleOrDefaultAsync(u => u.UUID == UUID);
            if (user != null)
            {
                var userSelectedCategory = await db.SelectedCategories.SingleOrDefaultAsync(st => st.UserID == user.ID);

                if (await CategoryExists(CategoryID))
                {
                    if (CategoryID == Constants.DefaultUser.CategoryID) //TODO : think about changing default item Over Time :(
                    {
                        userSelectedCategory.CategoryID = CategoryID;
                        await db.SaveChangesAsync();
                    }
                    else
                    {
                        bool hasBoughtCategory = db.PurchaseCategories.AsNoTracking()
                                                        .Count(pc => pc.UserID == user.ID && pc.CategoryID == CategoryID) ==
                                                        Constants.DefaultValues.PurchaseCategoryNumberAllowedToBuy; // user has bought properly
                        if (hasBoughtCategory)
                        {
                            userSelectedCategory.CategoryID = CategoryID;
                            await db.SaveChangesAsync();
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
                    return NotFound(); // TODO : Change to UnAuthorized Request
                }
            }
            else
            {
                return NotFound(); // TODO : Change with UnAuthorized
            }
        }


        [ResponseType(typeof(Models.Api.SCategory))]
        [Route("Categories/Purchased/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetPurchasedCategoryList(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();

            if(userID != 0) // User Found
            {

                var userActiveCategories = await db.Categories.Where(c => c.ID == Constants.DefaultUser.CategoryID || 
                                                                        db.PurchaseCategories.Where(pc => pc.UserID == userID)
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


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private async Task<bool> CategoryExists(int id)
        {
            return await db.Categories.CountAsync(e => e.ID == id) > 0;
        }
    }
}