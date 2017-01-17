using Falcon.Common;
using Falcon.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    public class UserAuthenticatorController : ApiController
    {
        private DBEntity db = new DBEntity();

        private readonly IDateTime mDateTime;

        public UserAuthenticatorController(IDateTime dateTime)
        {
            mDateTime = dateTime;
        }


        [ResponseType(typeof(Models.User))]
        [Route("UserAuthenticator/UUID/{UUID}")]
        public async Task<IHttpActionResult> GetUser(string UUID)
        {
            var result = db.Users.SingleOrDefault(c => c.UUID == UUID);
            if (result != null)
            {
                var userModel = new Models.User
                {
                    ID = result.ID,
                    UUID = result.UUID,
                    UserName = result.UserName,
                    UserTypeID = result.UserTypeID,
                    TotalStars = result.TotalStars,
                    LastSceneDateTime = result.LastSceneDateTime,
                    LevelAnsweredNumber = result.LevelAnsweredNumber,
                    CurrentLevelID = result.CurrentLevelID,
                    IsAbleToWriteComment = result.IsAbleToWriteComment
                };
                return Ok(userModel);
            }
            else
            {
                return await CreateNewUser(UUID);
            }
        }

        private async Task<IHttpActionResult> CreateNewUser(string UUID)
        {
            User user = new User
            {
                UUID = UUID,
                UserName = Constants.DefaulUser.UserName,
                UserTypeID = Constants.DefaulUser.UserTypeID,
                TotalStars = Constants.DefaulUser.TotalStar,
                LastSceneDateTime = mDateTime.UtcNow,
                LevelAnsweredNumber = Constants.DefaulUser.LevelAnswerdNumber,
                CurrentLevelID = Constants.DefaulUser.CurrentLevelID,
                IsAbleToWriteComment = Constants.DefaulUser.IsAbleToWriteComment
            };

            var registeredUser = db.Users.Add(user);
            await db.SaveChangesAsync();

            SelectedTheme selecetedTheme = new SelectedTheme
            {
                UserID = registeredUser.ID,
                AppThemeID = Constants.DefaulUser.AppThemeID
            };

            SelectedCategory selectedCategory = new SelectedCategory
            {
                UserID = registeredUser.ID,
                CategoryID = Constants.DefaulUser.CategoryID
            };

            UserInfo userInfo = new UserInfo
            {
                UserID = registeredUser.ID,
                FirstName = Constants.DefaulUser.FirstName,
                LastName = Constants.DefaulUser.LastName,
                Email = Constants.DefaulUser.Email,
                PhoneNumber = Constants.DefaulUser.PhoneNumber,
                GoogleID = Constants.DefaulUser.GoogleID,
                IsVerified = Constants.DefaulUser.IsVerified,
                IsBanned = Constants.DefaulUser.IsBanned,
                RegisterDateTime = mDateTime.UtcNow
            };

            db.SelectedThemes.Add(selecetedTheme);
            db.SelectedCategories.Add(selectedCategory);
            db.UserInfoes.Add(userInfo);
            await db.SaveChangesAsync();

            var userModel = new Models.User
            {
                ID = user.ID,
                UUID = user.UUID,
                UserName = user.UserName,
                UserTypeID = user.UserTypeID,
                TotalStars = user.TotalStars,
                LastSceneDateTime = user.LastSceneDateTime,
                LevelAnsweredNumber = user.LevelAnsweredNumber,
                CurrentLevelID = user.CurrentLevelID,
                IsAbleToWriteComment = user.IsAbleToWriteComment
            };

            return Ok(userModel);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
