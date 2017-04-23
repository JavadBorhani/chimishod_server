// Flapp Copyright 2017-2018

using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.Exceptions;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class UserAuthenticatorController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IDbContext mDbContext;
        private readonly IWebUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;

        public UserAuthenticatorController(IDbContext Context , 
            IDateTime dateTime, 
            IDbContext Database , 
            IWebUserSession UserSession , 
            IGlobalApplicationState AppState)
        {
            mDateTime = dateTime;
            mDbContext = Context;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState;
        }

        [ResponseType(typeof(SUser))]
        [Route("UserAuthenticator/")]
        public async Task<IHttpActionResult> GetUser()
        {
            //TODO : Validate User UUID and Add User Cellphone

            var user = await mDb.Set<User>().AsNoTracking().Where(c => c.UUID == mUserSession.UUID).Include( c => c.Level).SingleOrDefaultAsync();
            if (user != null)
            {
                var UserModel = new SUser
                {
                    ID = user.ID,
                    UserName = user.UserName,
                    UserTypeID = user.UserTypeID,
                    TotalStars = user.TotalStars,
                    Score = user.Score,
                    LevelProgress = user.LevelProgress,                    
                    IsAbleToWriteComment = user.IsAbleToWriteComment,
                };

                
                var CurrentLevel = new Models.Api.SLevel
                {
                    ID = user.CurrentLevelID,
                    LevelNumber = user.Level.LevelNumber,
                    Ceil = user.Level.ScoreCeil,
                    Coin = user.Level.Star,
                };

                var NextLevel = await mDb.Set<Level>().AsNoTracking()
                    .Where(l => l.LevelNumber == (CurrentLevel.LevelNumber + 1))
                    .Select( l => new SLevel
                    {
                        ID = l.ID,
                        LevelNumber = l.LevelNumber,
                        Ceil = l.ScoreCeil,
                        Coin = l.Star
                    })
                    .SingleOrDefaultAsync();


                var CurrentSelectedTheme = await mDb.Set<SelectedTheme>().AsNoTracking()
                    .Include(st => st.AppTheme)
                    .Where(st => st.UserID == user.ID)
                    .Select(st =>  new SAppTheme
                    {
                        ID = st.AppTheme.ID,
                        BackImage = st.AppTheme.BackImage,
                        DialogImage = st.AppTheme.DialogImage,
                        Price = st.AppTheme.Price,
                        Name = st.AppTheme.Name,
                    })
                    .SingleOrDefaultAsync();

                var selectedCat = await mDb.Set<SelectedCategory>().AsNoTracking()
                    .Where(sc => sc.UserID == user.ID)
                    .Include(sc => sc.Category)
                    .Select(u => new { u.Category.ID , u.Category.Name , u.Category.PrizeCoefficient })
                    .SingleOrDefaultAsync();

                var UserState = new SUserState
                {
                    UserStar = user.TotalStars,
                    SelectedCategoryID = selectedCat.ID,
                    SelectedCategoryName = selectedCat.Name,
                    SelectedCategoryCoEfficient = selectedCat.PrizeCoefficient,
                    SelectedThemeID = CurrentSelectedTheme.ID
                };

                var avatar = await mDb.Set<SelectedAvatar>().AsNoTracking()
                    .Where(sa => sa.UserID == user.ID)
                    .Include(sa => sa.UserAvatar)
                    .Select(u => new { u.UserAvatar.ID, u.UserAvatar.PicUrl })
                    .SingleOrDefaultAsync();

                var UserAvatar = new SUserAvatar
                {
                    ID = avatar.ID,
                    PicUrl = avatar.PicUrl,
                };

                var Seen = await mDb.Set<User>().Where(c => c.ID == user.ID).SingleOrDefaultAsync();
                Seen.PrevLastSeenDateTime = Seen.LastSeenDateTime; 
                Seen.LastSeenDateTime = mDateTime.Now;
                await mDb.SaveChangesAsync();

                return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { UserModel, UserState , UserAvatar , CurrentLevel , NextLevel , CurrentSelectedTheme })); //TODO : Does not support xml change to something generic
            }
            else
            {
                return await CreateNewUser(mUserSession.UUID);
            }
        }

        private async Task<IHttpActionResult> CreateNewUser(string UUID)
        {
            User user = new User
            {
                UUID = UUID,
                UserName = mAppState.State().User_DefaultUserName,
                UserTypeID = Constants.DefaultUser.UserTypeID,
                TotalStars = mAppState.State().User_DefaultUserCoin,
                Score = Constants.DefaultUser.Score,
                LevelProgress = Constants.DefaultUser.LevelProgress,
                CurrentLevelID = Constants.DefaultUser.CurrentLevelD,
                IsAbleToWriteComment = Constants.DefaultUser.IsAbleToWriteComment,
                LastSeenDateTime = mDateTime.Now,
                PrevLastSeenDateTime = mDateTime.Now,
            };

            var registeredUser = mDb.Set<User>().Add(user);
            await mDb.SaveChangesAsync();

            var userReg = mDb.Set<User>().Attach(user);

            userReg.UserName += registeredUser.ID;

            user.UserName = userReg.UserName;
           
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
                RegisterDateTime = mDateTime.Now,
                IsEditable = Constants.DefaultUser.EditableCount,
                Password = "" + mDateTime.Ticks,
            };

            SelectedAvatar selectedAvatar = new SelectedAvatar
            {
                UserID = registeredUser.ID,
                UserAvatarID = Constants.DefaultUser.AvatarID,
            };

            mDb.Set<SelectedTheme>().Add(selecetedTheme);
            mDb.Set<SelectedCategory>().Add(selectedCategory);
            mDb.Set<UserInfo>().Add(userInfo);
            mDb.Set<SelectedAvatar>().Add(selectedAvatar);

            await mDb.SaveChangesAsync();

            var UserModel = new SUser
            {
                ID = user.ID,
                UserName = user.UserName,
                UserTypeID = user.UserTypeID,
                TotalStars = user.TotalStars,
                Score = user.Score,
                LevelProgress = user.LevelProgress,
                IsAbleToWriteComment = user.IsAbleToWriteComment,
            };
            var CurrentSelectedTheme = await mDb.Set<AppTheme>().AsNoTracking()
                                                                .Where(at => at.ID == Constants.DefaultUser.AppThemeID)
                                                                .Select(at => new SAppTheme
                                                                {
                                                                    ID = at.ID,
                                                                    BackImage = at.BackImage,
                                                                    DialogImage = at.DialogImage,
                                                                    Price = at.Price,
                                                                    Name = at.Name,
                                                                })
                                                                .SingleOrDefaultAsync();

            int levelNumber = Constants.DefaultUser.LevelNumber;

            var levelsInfo = await mDb.Set<Level>().AsNoTracking()
                .Where(l => l.LevelNumber == levelNumber || l.LevelNumber == (levelNumber + 1))
                .OrderBy( l => l.LevelNumber)
                .ToArrayAsync();

            if(levelsInfo.Length != 2)
            {
                throw new ChildObjectNotFoundException("Level Number Should be 2 but it's " + levelsInfo.Length);
            }
            var CurrentLevel = new SLevel
            {
                ID = levelsInfo[0].ID,
                LevelNumber = levelsInfo[0].LevelNumber,
                Ceil = levelsInfo[0].ScoreCeil,
                Coin = levelsInfo[0].Star,
            };

            var NextLevel = new SLevel
            {
                ID = levelsInfo[1].ID,
                LevelNumber = levelsInfo[1].LevelNumber,
                Ceil = levelsInfo[1].ScoreCeil,
                Coin = levelsInfo[1].Star,
            };

            var catInfo = await mDb.Set<Category>().AsNoTracking()
                                                .Where(c => c.ID == Constants.DefaultUser.CategoryID)
                                                .Select(c => new { c.Name, c.PrizeCoefficient })
                                                .SingleOrDefaultAsync();

            var avatar = await mDb.Set<SelectedAvatar>().AsNoTracking()
                  .Where(sa => sa.UserID == user.ID)
                  .Include(sa => sa.UserAvatar)
                  .Select(u => new { u.UserAvatar.ID, u.UserAvatar.PicUrl })
                  .SingleOrDefaultAsync();

            var UserAvatar = new SUserAvatar
            {
                ID = avatar.ID,
                PicUrl = avatar.PicUrl,
            };

            if (catInfo != null)
            {
                var UserState = new SUserState
                {
                    UserStar = UserModel.TotalStars,
                    SelectedCategoryID = Constants.DefaultUser.CategoryID,
                    SelectedThemeID = Constants.DefaultUser.AppThemeID,
                    SelectedCategoryName = catInfo.Name,
                    SelectedCategoryCoEfficient = catInfo.PrizeCoefficient,
                };
                return ResponseMessage(Request.CreateResponse(HttpStatusCode.Created, new
                {
                    UserModel,
                    UserState ,
                    UserAvatar ,
                    CurrentLevel ,
                    NextLevel,
                    CurrentSelectedTheme
                }));
            }
            else
            {
                throw new ChildObjectNotFoundException("Cat information is null");
            }
            
        }

    }
}
