// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using Falcon.EFCommonContext;
using Falcon.Web.Common;
using log4net;
using Falcon.Common.Logging;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class AppThemesController : FalconApiController
    {
      
        private readonly IDateTime mDateTime;
        private readonly IDbContext mDb;
        private readonly ILog mLogger;
        private readonly IWebUserSession mUserSessoin;
        public AppThemesController(IDateTime dateTime , IDbContext Database , ILogManager LogManager , IWebUserSession UserSession)
        {
            mDateTime = dateTime;
            mDb = Database;
            mLogger = LogManager.GetLog(typeof(AppThemesController));
            mUserSessoin = UserSession;
        }

        [ResponseType(typeof(Models.Api.SAppTheme))]
        [Route("Themes/")]
        [HttpGet]
        public async Task<IHttpActionResult> GetAppThemes()
        {
            //TODO : Convert Whole of this into one join 
            var themes = await mDb.Set<AppTheme>().AsNoTracking().ToArrayAsync();
            var selectedTheme = await mDb.Set<SelectedTheme>().AsNoTracking().Where(st => st.UserID == mUserSessoin.UserID).Select( st => st.AppThemeID).SingleOrDefaultAsync();
            var purchasedThemes = await mDb.Set<PurchaseTheme>().AsNoTracking().Where(pt => pt.UserID == mUserSessoin.UserID).Select(c => c.ThemeID).ToListAsync();

            if(themes.Length > 0 && selectedTheme > 0 && purchasedThemes.Count >= 0)
            {
                Models.Api.SAppTheme[] userThemes = new Models.Api.SAppTheme[themes.Length];

                for (int i = 0; i < themes.Length; ++i)
                {
                    userThemes[i] = new Models.Api.SAppTheme
                    {
                        ID = themes[i].ID,
                        Name = themes[i].Name,
                        ShortDescription = themes[i].ShortDesciption,
                        LongDescription = themes[i].LongDescription,
                        SquareColor = themes[i].SquareColor,
                        CircleColor = themes[i].CircleColor,
                        Price = themes[i].Price,
                        BackImage = themes[i].BackImage,
                        DialogImage = themes[i].DialogImage,
                        IsPurchased = (themes[i].ID == Constants.DefaultUser.AppThemeID) ? true : purchasedThemes.Contains(themes[i].ID), // TODO : remember to remove what has checked to increase checking time
                        IsActive = (selectedTheme == themes[i].ID) ? true : false
                    };                        
                }

                return Ok(userThemes);
            }

            return NotFound();
        }
        [ResponseType(typeof(Models.Api.SUserState))]
        [Route("Themes/Select/{ThemeID}")] // TODO : Change To Action
        [HttpPost]
        public async Task<IHttpActionResult> SelectAppTheme(int ThemeID)
        {
            var user = await mDb.Set<User>().AsNoTracking().SingleOrDefaultAsync(u => u.UUID == mUserSessoin.UUID);
            if(user != null)
            {
                var userSelectedTheme = await mDb.Set<SelectedTheme>().SingleOrDefaultAsync(st => st.UserID == user.ID);

                if(await AppThemeExists(ThemeID))
                {
                    if (ThemeID == Constants.DefaultUser.AppThemeID) //TODO : think about changing default item Over Time :(
                    {
                        userSelectedTheme.AppThemeID = ThemeID;
                        await mDb.SaveChangesAsync();
                    }
                    else
                    {
                        bool hasBoughtTheme = mDb.Set<PurchaseTheme>().AsNoTracking()
                                                        .Count(ph => ph.UserID == user.ID && ph.ThemeID == ThemeID) == 
                                                        Constants.DefaultValues.PurchaseThemeNumberAllowedToBuy; // user has bought properly
                        if (hasBoughtTheme)
                        {
                            userSelectedTheme.AppThemeID = ThemeID;
                            await mDb.SaveChangesAsync();
                        }
                        else
                        {
                            mLogger.Error("Item has not been purchased + " + mUserSessoin.UUID);
                        }
                    }

                    var userState = new Models.Api.SUserState
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
                    return Response(HttpStatusCode.Unauthorized) ; 
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized); 
            }

        }

        [ResponseType(typeof(Models.Api.SUserState))]
        [Route("Themes/Buy/{ThemeID}")] // TODO : Change To Action
        [HttpPost]
        public async Task<IHttpActionResult> BuyTheme(int ThemeID)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == mUserSessoin.UUID);
            if(user != null)
            {
                bool bought = false;
                var theme = await mDb.Set<AppTheme>().FindAsync(ThemeID);
                var selectedTheme = await mDb.Set<SelectedTheme>().SingleOrDefaultAsync(sc => sc.UserID == user.ID);
                if (theme != null)
                {
                    bool hasBought = (ThemeID == Constants.DefaultUser.AppThemeID) ? true : await mDb.Set<PurchaseTheme>().CountAsync(ph => ph.UserID == user.ID && ph.ThemeID == ThemeID) > 0;
                    if (hasBought)
                    {
                        mLogger.Error("Trying to buy an item which has been purchased" + mUserSessoin.UUID);
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

                            mDb.Set<PurchaseTheme>().Add(newTheme);
                            
                            //Select as the current theme
                            
                            selectedTheme.AppThemeID = ThemeID;

                            bought = true;

                            await mDb.SaveChangesAsync();
                        }
                    }
                }

                var clientResult = new Models.Api.SUserState
                {
                    UserStar = user.TotalStars,
                    SelectedThemeID = selectedTheme.AppThemeID,
                    SelectedCategoryID = null,
                    SelectedCategoryName = null,
                    Bought = bought,
                    RequestID = ThemeID,
                };
                return Ok(clientResult);
            }

            return NotFound();
        }
      

        private async Task<bool> AppThemeExists(int id)
        {
            return await mDb.Set<AppTheme>().CountAsync(e => e.ID == id) > 0;
        }
    }
}