﻿using System;
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
                var selectedTheme = await db.SelectedThemes.AsNoTracking().SingleOrDefaultAsync(st => st.UserID == user.ID);
                var purchasedThemes = await db.PurchaseThemes.AsNoTracking().Where(pt => pt.UserID == user.ID).Select(c => c.ThemeID).ToListAsync();

                if(themes.Length == 0 || selectedTheme != null || purchasedThemes.Count == 0)
                {
                    Models.Api.AppTheme[] userThemes = new Models.Api.AppTheme[themes.Length];

                    for (int i = 0; i < themes.Length; ++i)
                    {

                        userThemes[i] = new Models.Api.AppTheme
                        {
                            ID = themes[i].ID,
                            Name = themes[i].Name,
                            ShortDesciption = themes[i].ShortDesciption,
                            LongDescription = themes[i].LongDescription,
                            SquareColor = themes[i].SquareColor,
                            CircleColor = themes[i].CircleColor,
                            Price = themes[i].Price,
                            IsPurchased = purchasedThemes.Contains(themes[i].ID),
                            IsActive = (selectedTheme.AppThemeID == themes[i].ID) ? true : false
                        };                        
                    }

                    return Ok(userThemes);
                }

                return NotFound();
            }

            return NotFound();  // TODO : Replace with UnAuthorized
        }


        [ResponseType(typeof(Models.Api.AppTheme))]
        [Route("Themes/{UUID}/{ThemeID}")]
        [HttpPost]
        public async Task<IHttpActionResult> SelectAppTheme(String UUID , int ThemeID)
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
                        bool result = db.PurchaseThemes.AsNoTracking().Count(ph => ph.UserID == user.ID && ph.ThemeID == ThemeID) == 1; // user has bought properly
                        if (result)
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

        [ResponseType(typeof(Models.Api.AppTheme))]
        [Route("Themes/Buy/{UUID}/{ThemeID}")]
        [HttpGet]
        public async Task<IHttpActionResult> BuyTheme(string UUID , int ThemeID)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            if(user != null)
            {
                var theme = await db.AppThemes.FindAsync(ThemeID);
                var selectedTheme = await db.SelectedThemes.SingleOrDefaultAsync(sc => sc.UserID == user.ID);
                if (theme != null)
                {
                    bool hasBought = db.PurchaseThemes.Count(ph => ph.UserID == user.ID && ph.ThemeID == ThemeID) > 0;
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
       

        //// PUT: api/AppThemes/5
        //[ResponseType(typeof(void))]
        //public async Task<IHttpActionResult> PutAppTheme(int id, AppTheme appTheme)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    if (id != appTheme.ID)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(appTheme).State = EntityState.Modified;

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!AppThemeExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return StatusCode(HttpStatusCode.NoContent);
        //}

        //// POST: api/AppThemes
        //[ResponseType(typeof(AppTheme))]
        //public async Task<IHttpActionResult> PostAppTheme(AppTheme appTheme)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    db.AppThemes.Add(appTheme);

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateException)
        //    {
        //        if (AppThemeExists(appTheme.ID))
        //        {
        //            return Conflict();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return CreatedAtRoute("DefaultApi", new { id = appTheme.ID }, appTheme);
        //}

        //// DELETE: api/AppThemes/5
        //[ResponseType(typeof(AppTheme))]
        //public async Task<IHttpActionResult> DeleteAppTheme(int id)
        //{
        //    AppTheme appTheme = await db.AppThemes.FindAsync(id);
        //    if (appTheme == null)
        //    {
        //        return NotFound();
        //    }

        //    db.AppThemes.Remove(appTheme);
        //    await db.SaveChangesAsync();

        //    return Ok(appTheme);
        //}

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