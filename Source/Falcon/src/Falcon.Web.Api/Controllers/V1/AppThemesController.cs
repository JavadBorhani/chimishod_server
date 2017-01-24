using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Database;
using Falcon.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    public class AppThemesController : ApiController
    {
        private DBEntity db = new DBEntity();

        private readonly IDateTime mDateTime;
        public AppThemesController(IDateTime dateTime)
        {
            mDateTime = dateTime;
        }

        [ResponseType(typeof(Models.Api.AppTheme))]
        [Route("Themes/{UUID}")]
        [HttpGet]
        public async Task<IHttpActionResult> GetAppThemes(string UUID)
        {
            //TODO : Convert Whole of this into one join 

            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            if(user != null)
            {
                var themes = await db.AppThemes.AsNoTracking().ToArrayAsync();
                var selectedTheme = await db.SelectedThemes.AsNoTracking().Where(st => st.UserID == user.ID).Select( st => st.AppThemeID).SingleOrDefaultAsync();
                var purchasedThemes = await db.PurchaseThemes.AsNoTracking().Where(pt => pt.UserID == user.ID).Select(c => c.ThemeID).ToListAsync();

                if(themes.Length > 0 && selectedTheme > 0 && purchasedThemes.Count >= 0)
                {
                    Models.Api.AppTheme[] userThemes = new Models.Api.AppTheme[themes.Length];

                    for (int i = 0; i < themes.Length; ++i)
                    {
                        userThemes[i] = new Models.Api.AppTheme
                        {
                            ID = themes[i].ID,
                            Name = themes[i].Name,
                            ShortDescription = themes[i].ShortDesciption,
                            LongDescription = themes[i].LongDescription,
                            SquareColor = themes[i].SquareColor,
                            CircleColor = themes[i].CircleColor,
                            Price = themes[i].Price,
                            IsPurchased = (themes[i].ID == Constants.DefaulUser.AppThemeID) ? true : purchasedThemes.Contains(themes[i].ID), // TODO : remember to remove what has checked to increase checking time
                            IsActive = (selectedTheme == themes[i].ID) ? true : false
                        };                        
                    }

                    return Ok(userThemes);
                }

                return NotFound();
            }

            return NotFound();  // TODO : Replace with UnAuthorized
        }


        [ResponseType(typeof(Models.Api.UserState))]
        [Route("Themes/Select/{UUID}/{ThemeID}")] // TODO : Change To Action
        [HttpPost]
        public async Task<IHttpActionResult> SelectAppTheme(string UUID , int ThemeID)
        {
            var user = await db.Users.AsNoTracking().SingleOrDefaultAsync(u => u.UUID == UUID);
            if(user != null)
            {
                var userSelectedTheme = await db.SelectedThemes.SingleOrDefaultAsync(st => st.UserID == user.ID);

                if(AppThemeExists(ThemeID))
                {
                    if (ThemeID == Constants.DefaulUser.AppThemeID) //TODO : think about changing default item Over Time :(
                    {
                        userSelectedTheme.AppThemeID = ThemeID;
                        await db.SaveChangesAsync();
                    }
                    else
                    {
                        bool hasBoughtTheme = db.PurchaseThemes.AsNoTracking()
                                                        .Count(ph => ph.UserID == user.ID && ph.ThemeID == ThemeID) == 
                                                        Constants.DefaultValues.PurchaseThemeNumberAllowedToBuy; // user has bought properly
                        if (hasBoughtTheme)
                        {
                            userSelectedTheme.AppThemeID = ThemeID;
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
                        SelectedThemeID = userSelectedTheme.AppThemeID,
                        SelectedCategoryName = null,
                        SelectedCategoryID = null
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

        [ResponseType(typeof(Models.Api.UserState))]
        [Route("Themes/Buy/{UUID}/{ThemeID}")] // TODO : Change To Action
        [HttpPost]
        public async Task<IHttpActionResult> BuyTheme(string UUID , int ThemeID)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            if(user != null)
            {
                var theme = await db.AppThemes.FindAsync(ThemeID);
                var selectedTheme = await db.SelectedThemes.SingleOrDefaultAsync(sc => sc.UserID == user.ID);
                if (theme != null)
                {
                    bool hasBought = (ThemeID == Constants.DefaulUser.AppThemeID) ? true : db.PurchaseThemes.Count(ph => ph.UserID == user.ID && ph.ThemeID == ThemeID) > 0;
                    if (hasBought)
                    {
                        //TODO : Log to system , unAuthorized Request
                    }
                    else
                    {
                        if(user.TotalStars - theme.Price >= 0 )
                        {
                            user.TotalStars -= theme.Price;

                            PurchaseTheme newTheme = new PurchaseTheme
                            {
                                UserID = user.ID,
                                ThemeID = ThemeID,
                                PurchaseDate = mDateTime.Now
                            };

                            db.PurchaseThemes.Add(newTheme);
                            
                            //Select as the current theme
                            
                            selectedTheme.AppThemeID = ThemeID;

                            await db.SaveChangesAsync();
                        }
                    }
                }

                var clientResult = new Models.Api.UserState
                {
                    UserStar = user.TotalStars,
                    SelectedThemeID = selectedTheme.AppThemeID,
                    SelectedCategoryID = null,
                    SelectedCategoryName = null
                };
                return Ok(clientResult);
            }

            return NotFound();
        }
      

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AppThemeExists(int id)
        {
            return db.AppThemes.Count(e => e.ID == id) > 0;
        }
    }
}