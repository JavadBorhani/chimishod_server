// Flapp Copyright 2017-2018

using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.Exceptions;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Level;
using System;
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
        private readonly IUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;
        private readonly ICharacteristicsMaintenanceProcessor mCharacteristicsMaintenanceProcessor;
        private readonly ICharacteristicsInquiryProcessor mCharacteristicsInquiryProcessor;

        public UserAuthenticatorController(IDbContext Context , 
            IDateTime dateTime, 
            IDbContext Database ,
            IUserSession UserSession , 
            IGlobalApplicationState AppState , 
            ICharacteristicsMaintenanceProcessor CharacteristicsMaintenanceProcessor,
            ICharacteristicsInquiryProcessor CharacteristicsInquiryProcessor)
        {
            mDateTime = dateTime;
            mDbContext = Context;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState;
            mCharacteristicsMaintenanceProcessor = CharacteristicsMaintenanceProcessor;
            mCharacteristicsInquiryProcessor = CharacteristicsInquiryProcessor;
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
                    TotalCoin = user.TotalCoin,
                    LevelProgress = user.LevelProgress,                    
                    IsAbleToWriteComment = user.IsAbleToWriteComment,
                };

                var result = await mDb.Set<UserStat>().AsNoTracking().Where(us => us.UserID == user.ID).Select(u => new 
                {
                    u.SpinRemainedChance ,
                    u.SpinWheelCount,  
                    u.Score,
                }).SingleOrDefaultAsync();


                UserModel.RemainedSpinChance = result.SpinRemainedChance;
                UserModel.TotalSpinCount = result.SpinWheelCount;
                UserModel.Score = result.Score;
                
                var CurrentLevel = new SLevel
                {
                    LevelNumber = user.Level.LevelNumber,
                    Ceil = user.Level.ScoreCeil,
                    Coin = user.Level.Star,
                };

                var NextLevel = await mDb.Set<Level>().AsNoTracking()
                    .Where(l => l.LevelNumber == (CurrentLevel.LevelNumber + 1))
                    .Select( l => new SLevel
                    {
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
                    .Select(u => new { u.Category.ID , u.Category.Name , u.Category.ScoreCoefficient, })
                    .SingleOrDefaultAsync();

                var UserState = new SUserState
                {
                    UserStar = user.TotalCoin,
                    SelectedCategoryID = selectedCat.ID,
                    SelectedCategoryName = selectedCat.Name,
                    SelectedCategoryCoEfficient = selectedCat.ScoreCoefficient,
                    SelectedThemeID = CurrentSelectedTheme.ID
                };

                var CategoryCharacters = await mCharacteristicsInquiryProcessor.GetCategoryAssignedCharacters(selectedCat.ID);

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

                var currentUser = await mDb.Set<User>().Where(c => c.ID == user.ID).SingleOrDefaultAsync();
                currentUser.PrevLastSeenDateTime = currentUser.LastSeenDateTime;
                currentUser.LastSeenDateTime = mDateTime.Now;

                if ((currentUser.LastSeenDateTime.Date - currentUser.PreviousDaySeen.Date).Days >= 1)
                {
                    if((currentUser.LastSeenDateTime.Date - currentUser.PreviousDaySeen.Date).Days <= 1)
                    {
                        ++currentUser.DWMCount;
                    }
                    else
                    {
                        currentUser.DWMCount = 0;
                    }

                    currentUser.PreviousDaySeen = mDateTime.Now;
                }
                await mDb.SaveChangesAsync();

                return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, 
                    new
                    {
                        UserModel,
                        UserState ,
                        UserAvatar ,
                        CurrentLevel ,
                        NextLevel ,
                        CurrentSelectedTheme ,
                        CategoryCharacters
                    })); //TODO : Does not support xml change to something generic
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
                UserName = mAppState.GetState().User_DefaultUserName,
                UserTypeID = Constants.DefaultUser.UserTypeID,
                TotalCoin = mAppState.GetState().User_DefaultUserCoin,
                LevelProgress = Constants.DefaultUser.LevelProgress,
                CurrentLevelNumber = Constants.DefaultUser.CurrentLevelNumber,
                IsAbleToWriteComment = Constants.DefaultUser.IsAbleToWriteComment,
                LastSeenDateTime = mDateTime.Now,
                PrevLastSeenDateTime = mDateTime.Now,
                PreviousDaySeen = mDateTime.Now,
                DWMCount = Constants.DefaultUser.DWMDefaultCount , 
                IsTutorial = true,
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

            UserStat userStat = new UserStat
            {
                UserID = user.ID, 
                Rank = 0 , 
                Score = 0,
                OldScore = 0,
                SpinRemainedChance = Constants.DefaultUser.SpinWheelChance,
                SpinWheelCount = Constants.DefaultUser.SpinWheelCount
            };

            UserCount userCount = new UserCount
            {
                UserID = user.ID,
                PurchasedAvatarCount = 0,
                PurchasedCategoryCount = 0,
                PurchasedThemeCount = 0,
                CreatedQuestionsCount = 0
            };

            var catePurchase = new PurchaseCategory
            {
                UserID = user.ID,
                CategoryID = Constants.DefaultUser.CategoryID,
                AnswerCount = 0,
                PurchaseDate = mDateTime.Now
            };

            var themePurchase = new PurchaseTheme
            {
                UserID = user.ID,
                ThemeID = Constants.DefaultUser.AppThemeID,
                PurchaseDate = mDateTime.Now,
            };
            var avatarPurchase = new PurchaseAvatar
            {
                UserID = user.ID,
                UserAvatarID = Constants.DefaultUser.AvatarID,
                PurchasedDate = mDateTime.Now,
            };

            mDb.Set<UserCount>().Add(userCount);
            mDb.Set<UserStat>().Add(userStat);
            mDb.Set<UserInfo>().Add(userInfo);

            mDb.Set<PurchaseCategory>().Add(catePurchase);
            mDb.Set<PurchaseTheme>().Add(themePurchase);
            mDb.Set<PurchaseAvatar>().Add(avatarPurchase);

            mDb.Set<SelectedTheme>().Add(selecetedTheme);
            mDb.Set<SelectedCategory>().Add(selectedCategory);
            mDb.Set<SelectedAvatar>().Add(selectedAvatar);

            var CategoryCharacters = await mCharacteristicsInquiryProcessor.GetCategoryAssignedCharacters(Constants.DefaultUser.CategoryID);
            var one = await mCharacteristicsMaintenanceProcessor.AddUserCharacteristicToLeaderBoard(CategoryCharacters, user.ID);

            await mDb.SaveChangesAsync();

            var UserModel = new SUser
            {
                ID = user.ID,
                UserName = user.UserName,
                UserTypeID = user.UserTypeID,
                TotalCoin = user.TotalCoin,
                Score = userStat.Score,
                LevelProgress = user.LevelProgress,
                IsAbleToWriteComment = user.IsAbleToWriteComment,
                RemainedSpinChance = userStat.SpinRemainedChance,
                TotalSpinCount = userStat.SpinWheelCount
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

            var CurrentLevel = new SLevel
            {
                LevelNumber = levelsInfo[0].LevelNumber,
                Ceil = levelsInfo[0].ScoreCeil,
                Coin = levelsInfo[0].Star,
            };

            var NextLevel = new SLevel
            {
                LevelNumber = levelsInfo[1].LevelNumber,
                Ceil = levelsInfo[1].ScoreCeil,
                Coin = levelsInfo[1].Star,
            };

            var catInfo = await mDb.Set<Category>().AsNoTracking()
                                                .Where(c => c.ID == Constants.DefaultUser.CategoryID)
                                                .Select(c => new { c.Name, c.ScoreCoefficient })
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
                    UserStar = UserModel.TotalCoin,
                    SelectedCategoryID = Constants.DefaultUser.CategoryID,
                    SelectedThemeID = Constants.DefaultUser.AppThemeID,
                    SelectedCategoryName = catInfo.Name,
                    SelectedCategoryCoEfficient = catInfo.ScoreCoefficient,
                };
                return ResponseMessage(Request.CreateResponse(HttpStatusCode.Created, new
                {
                    UserModel,
                    UserState ,
                    UserAvatar ,
                    CurrentLevel ,
                    NextLevel,
                    CurrentSelectedTheme,
                    CategoryCharacters
                }));
            }
            else
            {
                throw new ChildObjectNotFoundException("Cat information is null");
            }
            
        }

    }
}
