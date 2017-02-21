using Falcon.Common;
using Falcon.Data.Exceptions;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Results;

namespace Falcon.Web.Api.Controllers.V1
{
    public class UserAuthenticatorController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IDateTime mDateTime;
        private readonly IDbContext mDbContext;

        public UserAuthenticatorController(IDbContext Context , IDateTime dateTime)
        {
            mDateTime = dateTime;
            mDbContext = Context;
        }

        [ResponseType(typeof(Models.Api.SUser))]
        [Route("UserAuthenticator/UUID/{UUID}")]
        public async Task<IHttpActionResult> GetUser(string UUID)
        {
            //TODO : Validate User UUID and Add User Cellphone

            var user = await db.Users.AsNoTracking().Where(c => c.UUID == UUID).Include( c => c.Level).SingleOrDefaultAsync();
            if (user != null)
            {
                var UserModel = new Models.Api.SUser
                {
                    ID = user.ID,
                    UUID = user.UUID,
                    UserName = user.UserName,
                    UserTypeID = user.UserTypeID,
                    TotalStars = user.TotalStars,
                    LastSceneDateTime = user.LastSceneDateTime,
                    Score = user.Score,
                    LevelProgress = user.LevelProgress,
                    CurrentLevelID = user.CurrentLevelID,
                    IsAbleToWriteComment = user.IsAbleToWriteComment,
                    ScoreCeil = user.Level.ScoreCeil 
                };

                var selectedCat = await db.SelectedCategories.AsNoTracking()
                    .Where(sc => sc.UserID == user.ID)
                    .Include(sc => sc.Category)
                    .Select(u => new { u.Category.ID , u.Category.Name , u.Category.PrizeCoefficient })
                    .SingleOrDefaultAsync();

                var UserState = new Models.Api.SUserState
                {
                    UserStar = user.TotalStars,
                    SelectedCategoryID = selectedCat.ID,
                    SelectedCategoryName = selectedCat.Name,
                    SelectedCategoryCoEfficient = selectedCat.PrizeCoefficient,
                    SelectedThemeID = user.SelectedThemes.Where(st => st.UserID == user.ID).Select(st => st.AppThemeID).SingleOrDefault()
                };

                var avatar = await db.SelectedAvatars.AsNoTracking()
                    .Where(sa => sa.UserID == user.ID)
                    .Include(sa => sa.UserAvatar)
                    .Select(u => new { u.UserAvatar.ID, u.UserAvatar.PicUrl })
                    .SingleOrDefaultAsync();

                var UserAvatar = new Models.Api.SUserAvatar
                {
                    ID = avatar.ID,
                    PicUrl = avatar.PicUrl,
                };


                return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { UserModel, UserState , UserAvatar })); //TODO : Does not support xml change to something generic
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
                UserName = Constants.DefaultUser.UserName,
                UserTypeID = Constants.DefaultUser.UserTypeID,
                TotalStars = Constants.DefaultUser.TotalStar,
                Score = Constants.DefaultUser.Score,
                LevelProgress = Constants.DefaultUser.LevelProgress,
                CurrentLevelID = Constants.DefaultUser.CurrentLevelID,
                IsAbleToWriteComment = Constants.DefaultUser.IsAbleToWriteComment,
                LastSceneDateTime = mDateTime.Now,
            };

            var registeredUser = db.Users.Add(user);
            await db.SaveChangesAsync();

            SelectedTheme selecetedTheme = new SelectedTheme
            {
                UserID = registeredUser.ID,
                AppThemeID = Constants.DefaultUser.AppThemeID
            };

            SelectedCategory selectedCategory = new SelectedCategory
            {
                UserID = registeredUser.ID,
                CategoryID = Constants.DefaultUser.CategoryID
            };

            UserInfo userInfo = new UserInfo
            {
                UserID = registeredUser.ID,
                Email = Constants.DefaultUser.Email,
                PhoneNumber = Constants.DefaultUser.PhoneNumber,
                GoogleID = Constants.DefaultUser.GoogleID,
                IsVerified = Constants.DefaultUser.IsVerified,
                IsBanned = Constants.DefaultUser.IsBanned,
                RegisterDateTime = mDateTime.Now
            };

            SelectedAvatar selectedAvatar = new SelectedAvatar
            {
                UserID = registeredUser.ID,
                UserAvatarID = Constants.DefaultUser.AvatarID,
            };

            db.SelectedThemes.Add(selecetedTheme);
            db.SelectedCategories.Add(selectedCategory);
            db.UserInfoes.Add(userInfo);
            db.SelectedAvatars.Add(selectedAvatar);

            await db.SaveChangesAsync();

            var levelCeilScore = await db.Users.AsNoTracking()
                                        .Where(u => u.ID == user.ID)
                                        .Include( u => u.Level)
                                        .Select(u => u.Level.ScoreCeil)
                                        .SingleOrDefaultAsync();

            var UserModel = new Models.Api.SUser
            {
                ID = user.ID,
                UUID = user.UUID,
                UserName = user.UserName,
                UserTypeID = user.UserTypeID,
                TotalStars = user.TotalStars,
                LastSceneDateTime = user.LastSceneDateTime,
                Score = user.Score,
                LevelProgress = user.LevelProgress,
                CurrentLevelID = user.CurrentLevelID,
                IsAbleToWriteComment = user.IsAbleToWriteComment,
                ScoreCeil = levelCeilScore,
            };
            var catInfo = await db.Categories.AsNoTracking()
                                                .Where(c => c.ID == Constants.DefaultUser.CategoryID)
                                                .Select(c => new { c.Name, c.PrizeCoefficient })
                                                .SingleOrDefaultAsync();

            var avatar = await db.SelectedAvatars.AsNoTracking()
                  .Where(sa => sa.UserID == user.ID)
                  .Include(sa => sa.UserAvatar)
                  .Select(u => new { u.UserAvatar.ID, u.UserAvatar.PicUrl })
                  .SingleOrDefaultAsync();

            var UserAvatar = new Models.Api.SUserAvatar
            {
                ID = avatar.ID,
                PicUrl = avatar.PicUrl,
            };

            if (catInfo != null)
            {
                var UserState = new Models.Api.SUserState
                {
                    UserStar = UserModel.TotalStars,
                    SelectedCategoryID = Constants.DefaultUser.CategoryID,
                    SelectedThemeID = Constants.DefaultUser.AppThemeID,
                    SelectedCategoryName = catInfo.Name,
                    SelectedCategoryCoEfficient = catInfo.PrizeCoefficient,
                };
                return ResponseMessage(Request.CreateResponse(HttpStatusCode.Created, new { UserModel, UserState , UserAvatar }));
            }
            else
            {
                throw new ChildObjectNotFoundException("Cat information is null");
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

        private ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }

        private ResponseMessageResult Response(HttpStatusCode Code, object DataToSend)
        {
            return ResponseMessage(Request.CreateResponse(Code, DataToSend));
        }
    }
}
