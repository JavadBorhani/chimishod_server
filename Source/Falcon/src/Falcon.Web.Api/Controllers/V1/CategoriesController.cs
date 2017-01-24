using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Database;
using Falcon.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    public class CategoriesController : ApiController
    {
        private DBEntity db = new DBEntity();

        private readonly IDateTime mDateTime;

        public CategoriesController(IDateTime dateTime)
        {
            mDateTime = dateTime;
        }
           
        // GET: api/Categories
        public IQueryable<Category> GetCategories()
        {
            return db.Categories;
        }


        [ResponseType(typeof(Models.Api.Category))]
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
                    var userCategories = new Models.Api.Category[categories.Length];

                    for (int i = 0; i < categories.Length; ++i)
                    {
                        userCategories[i] = new Models.Api.Category
                        {
                            ID = categories[i].ID,
                            Name = categories[i].Name,
                            ShortDescription = categories[i].ShortDescription,
                            LongDescription = categories[i].LongDescription,
                            SquareColor = categories[i].SquareColor,
                            CircleColor = categories[i].CircleColor,
                            Price = categories[i].Price,
                            IsPurchased = (categories[i].ID == Constants.DefaulUser.CategoryID) ? true : purchasedCategories.Contains(categories[i].ID), // TODO : remember to remove what has checked to increase checking time
                            IsActive = (selectedCategory == categories[i].ID) ? true : false
                        };
                    }

                    return Ok(userCategories);
                }

                return NotFound();
            }

            return NotFound();  // TODO : Replace with UnAuthorized
        }

        [ResponseType(typeof(Models.Api.UserState))]
        [Route("Categories/Buy/{UUID}/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> BuyCategory(string UUID, int CategoryID)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            if (user != null)
            {
                var category = await db.Categories.FindAsync(CategoryID);
                var selectedCategory = await db.SelectedCategories.SingleOrDefaultAsync(sc => sc.UserID == user.ID);
                if (category != null)
                {
                    bool hasBought = (CategoryID == Constants.DefaulUser.AppThemeID) ? true : db.PurchaseCategories.Count(ph => ph.UserID == user.ID && ph.CategoryID == CategoryID) == 
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

                            selectedCategory.CategoryID = CategoryID;

                            await db.SaveChangesAsync();
                        }
                    }
                }

                var clientResult = new Models.Api.UserState
                {
                    UserStar = user.TotalStars,
                    SelectedThemeID = null,
                    SelectedCategoryID = selectedCategory.CategoryID,
                    SelectedCategoryName = selectedCategory.Category.Name
                };
                return Ok(clientResult);
            }

            return NotFound();
        }


        [ResponseType(typeof(Models.Api.UserState))]
        [Route("Categories/Select/{UUID}/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> SelectCategory(string UUID, int CategoryID)
        {
            var user = await db.Users.AsNoTracking().SingleOrDefaultAsync(u => u.UUID == UUID);
            if (user != null)
            {
                var userSelectedCategory = await db.SelectedCategories.SingleOrDefaultAsync(st => st.UserID == user.ID);

                if (CategoryExists(CategoryID))
                {
                    if (CategoryID == Constants.DefaulUser.CategoryID) //TODO : think about changing default item Over Time :(
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

                    var userState = new Models.Api.UserState
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


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CategoryExists(int id)
        {
            return db.Categories.Count(e => e.ID == id) > 0;
        }
    }
}