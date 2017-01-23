using Falcon.Common;
using Falcon.Database;
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


        [ResponseType(typeof(Models.Api.User))]
        [Route("UserAuthenticator/UUID/{UUID}")]
        public async Task<IHttpActionResult> GetUser(string UUID)
        {
            var user = db.Users.SingleOrDefault(c => c.UUID == UUID);
            if (user != null)
            {
                var UserModel = new Models.Api.User
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

                var selectedCatID = db.SelectedCategories.Where(sc => sc.UserID == user.ID).Select(u => u.CategoryID).SingleOrDefault();

                var UserState = new Models.Api.UserState
                {
                    UserStar = user.TotalStars,
                    SelectedCategoryID = selectedCatID,
                    SelectedCategoryName = db.Categories.FindAsync(selectedCatID).Result.Name,
                    SelectedThemeID = user.SelectedThemes.Where(st => st.UserID == user.ID).Select(st => st.AppThemeID).SingleOrDefault()
                };

                return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { UserModel, UserState })); //TODO : Does not support xml change to something generic
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
                LastSceneDateTime = mDateTime.Now,
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
                RegisterDateTime = mDateTime.Now
            };

            db.SelectedThemes.Add(selecetedTheme);
            db.SelectedCategories.Add(selectedCategory);
            db.UserInfoes.Add(userInfo);
            await db.SaveChangesAsync();

            var UserModel = new Models.Api.User
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
            var UserState = new Models.Api.UserState
            {
                UserStar = UserModel.TotalStars,
                SelectedCategoryID = Constants.DefaulUser.CategoryID,
                SelectedThemeID = Constants.DefaulUser.AppThemeID,
                SelectedCategoryName = db.Categories.FindAsync(Constants.DefaulUser.AppThemeID).Result.Name
            };
            return ResponseMessage(Request.CreateResponse(HttpStatusCode.Created , new { UserModel, UserState }));
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
