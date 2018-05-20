using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Common.Security;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Quest;
using Falcon.Web.Models.Api.User;
using log4net;
using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserQueryProcessor : IUserQueryProcessor
    {

        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly IDateTime mDateTime;
        private readonly ILog mLogger;

        public UserQueryProcessor(IDbContext Database, IWebUserSession UserSession , IDateTime DateTime , ILogManager LogManager)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
            mLogger = LogManager.GetLog(typeof(UserQueryProcessor));
        }

        public async Task<int> IncreaseCoin(int Coin)
        {
                
            var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();

            if (Coin <= 0)
                return user.TotalCoin;

            bool SaveFailed = false;
            do
            {
                SaveFailed = false;

                user.TotalCoin += Coin;
                try
                {
                    await mDb.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    SaveFailed = true;
                    ex.Entries.Single().Reload();
                }

            } while (SaveFailed);

            return user.TotalCoin;
        }

        public async Task<int> GetTotalCoin()
        {
            return await mDb.Set<User>().AsNoTracking().Where(u => u.ID == mUserSession.ID).Select(u => u.TotalCoin).SingleOrDefaultAsync();
        }

        public async Task<int> DecreaseCoin(int Coin)
        {
            
            var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();

            if (Coin <= 0)
                return user.TotalCoin;

            bool SaveFailed = false;
            do
            {
                SaveFailed = false;

                user.TotalCoin -= Coin;
                try
                {
                    await mDb.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    SaveFailed = true;
                    ex.Entries.Single().Reload();
                }

            } while (SaveFailed);

            return user.TotalCoin;
        }

        public async Task<User> LoadUser(int UserID)
        {
            var user = await mDb.Set<User>()
                .AsNoTracking()
                .Include( u => u.Level)
                .Where(u => u.ID == UserID)
                .SingleOrDefaultAsync();

            return user;
        }

        public async Task<bool> LevelExits(int LevelNumber)
        {
            var exists = await mDb.Set<Level>()
                .AsNoTracking()
                .CountAsync(l => l.LevelNumber == LevelNumber) > 0;

            return exists;
        }

        public async Task<int> GetLevelPrize(int LevelNumber)
        {
            int prize = await mDb.Set<Level>()
                .AsNoTracking()
                .Where(l => l.LevelNumber == LevelNumber)
                .Select(l => l.CoinPrize)
                .SingleOrDefaultAsync();

            return prize;
        }

        public async Task<SLevelUpInfo> UpdateLevel(int Prize , int LastLevel)
        {
            var player = await mDb.Set<User>().Where(m => m.ID == mUserSession.ID).Include( u => u.Level).SingleOrDefaultAsync();

            SLevelUpInfo level;
            bool SaveFailed = false;
          
            do
            {
                SaveFailed = false;
                level = LevelUpChecking(ref player, player.Level.ScoreCeil, Prize, (player.LevelNumber) + 1 , LastLevel);
                try
                {
                    await mDb.SaveChangesAsync();

                    var need = CheckIfNeedAnotherLevelUp(ref player);

                    if (need)
                    {
                        level.LevelUpMode = LevelUpMode.LeveledUpAndNeedAnother;
                    }

                }
                catch (DbUpdateConcurrencyException ex)
                {
                    SaveFailed = true;
                    ex.Entries.Single().Reload();
                }

            } while (SaveFailed);

            return level;
        }

        public async Task<SQuestUpInfo> UpdateQuest(int Prize, int LastQuestNumber)
        {
            var player = await mDb.Set<User>().Where(m => m.ID == mUserSession.ID).Include(u => u.Quest).SingleOrDefaultAsync();


            SQuestUpInfo quest;
            bool SaveFailed = false;


            int playerQuestNumber;


            do
            {
                playerQuestNumber = player.QuestNumber ?? -1;

                if (playerQuestNumber == -1)
                    return null;

                SaveFailed = false;

                quest = QuestUpChecking(ref player, Prize, player.Quest.NumberOfQuestionsInQuest, playerQuestNumber + 1, LastQuestNumber);

                try
                {
                    await mDb.SaveChangesAsync();

                    var need = CheckIfNeedAnotherQuest(ref player);

                    if (need)
                    {
                        quest.QuestUpMode = QuestUpMode.QuestUppedAndNeedAnother;
                    }
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    SaveFailed = true;
                    ex.Entries.Single().Reload();
                }

            } while (SaveFailed);

            return quest;
        }

        private bool CheckIfNeedAnotherLevelUp(ref User User)
        {
            if (User.LevelProgress >= User.Level.ScoreCeil)
                return true;

            return false;
        }

        private bool CheckIfNeedAnotherQuest(ref User User)
        {
            if(User.QuestProgress >= User.Quest.NumberOfQuestionsInQuest)
                return true;

            return false;   
        }

        private SLevelUpInfo LevelUpChecking(ref User User, int LevelCeil, int Prize, int NextLevelNumber , int LastLevel)
        {
            SLevelUpInfo info = new SLevelUpInfo();

            if ((User.LevelProgress + Prize >= LevelCeil))
            {
                if (NextLevelNumber > LastLevel)
                    return info;

                var currentLevelNumber = User.LevelNumber;

                User.LevelNumber = NextLevelNumber;
                int remained = (User.LevelProgress + Prize) - LevelCeil;
                User.LevelProgress = remained;

                info.LevelUpMode = LevelUpMode.LeveledUp;
                info.LevelUpNumber = currentLevelNumber;
            }
            else
            {
                User.LevelProgress += Prize;

                info.LevelUpMode = LevelUpMode.NotLeveledUp;
                info.LevelUpNumber = Constants.DefaultValues.NoLevelUp;
            }
            return info;
        }

        //public async Task<SUserCount> GetUserCountInfo(int UserID)
        //{
        //    //var data = await mDb.Set<UserCount>()
        //    //                .AsNoTracking()
        //    //                .Where(u => u.UserID == UserID)
        //    //                .SingleOrDefaultAsync();
        //    return null;
        //}
        //public async Task<bool> UpdateLastSeenDateTime()
        //{
        //    var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();
        //    user.PrevLastSeenDateTime = user.LastSeenDateTime;
        //    user.LastSeenDateTime = mDateTime.Now;
        //    await mDb.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<bool> UpdateLastSeenDateTimeToNow()
        //{
        //    var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();
        //    user.PrevLastSeenDateTime = mDateTime.Now;
        //    user.LastSeenDateTime = mDateTime.Now;
        //    await mDb.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<int> GetDWMCount()
        //{
        //    var count = await mDb.Set<User>()
        //        .AsNoTracking()
        //        .Where(u => u.ID == mUserSession.ID)
        //        .Select(u => u.DWMCount)
        //        .SingleOrDefaultAsync();
        //    return count;
        //}

        public async Task<User> CreateNewUser(SUserRegistrationForm UserRegisterationData , SGameConfig GameConfig)
        {
            //todo => change default datas to something valid 
            var user = mDb.Set<User>().Add(new User
            {
                IPAddress = UserRegisterationData.IPAddress,
                UUID = UserRegisterationData.UUID,
                UserName = UserRegisterationData.UserName,
                IsMale = Convert.ToBoolean(UserRegisterationData.Gender),
                NotificationID = UserRegisterationData.NotificationID.ToString(),
                Platform = (int)UserRegisterationData.Platform,
                LevelNumber = GameConfig.DefaultUserLevelNumber,
                LevelProgress = GameConfig.DefaultUserLevelProgress ,
                QuestNumber = GameConfig.DefaultUserQuestNumber,
                QuestProgress = GameConfig.DefaultUserQuestProgress,
                TotalCoin = GameConfig.DefaultUserCoinAmount,
                APILevel = UserRegisterationData.APILevel,
                Device = UserRegisterationData.Device,
                Model = UserRegisterationData.Model,
                Activated = true,
            });

            await mDb.SaveChangesAsync();
            return user;
        }

        public async Task<User> ReteriveUserByUserPass(SUserInfo userInfo)
        {
            var user = await mDb.Set<UserInfo>().AsNoTracking()
                .Include(u => u.User)
                .Where(u => u.User.UserName == userInfo.UserName && u.Password == userInfo.Password && u.IsInfoEnable == true)
                .Select(u => u.User)
                .SingleOrDefaultAsync();

            return user;
        }

        public async Task<bool> UpdateUserNotificationID(int UserID , string UUID)
        {
            var user = await mDb.Set<User>().FindAsync(UserID);

            if(user != null)
            {
                user.NotificationID = UUID;
                await mDb.SaveChangesAsync();
                return true;
            }
            return false;

        }

        public async Task<bool> Exists(string UserName)
        {
            var item = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.UserName == UserName)
                .CountAsync() > 0;

            return item;
        }

        public async Task<QueryResult<User>> SearchUserNames(PagedDataRequest RequestInfo, string Expression , int[] Excepts = null)
        {
            IQueryable<User> query; 

            if(Excepts != null)
                query = mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.UserName.Contains(Expression) && u.ID != mUserSession.ID && !Excepts.Contains(u.ID) && u.Activated == true)
                .OrderBy(u => u.ID);
            else
                query = mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.UserName.Contains(Expression) && u.ID != mUserSession.ID && u.Activated == true)
                .OrderBy( u => u.ID);

            var totalItemCount = await query.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(RequestInfo.PageNumber, RequestInfo.PageSize);

            var users = await query.Skip(startIndex).Take(RequestInfo.PageSize).ToListAsync();

            var queryResult = new QueryResult<User>(users, totalItemCount, RequestInfo.PageSize);

            return queryResult;

        }

        public async Task<User> GetUserByID(int UserID)
        {
            var user = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.ID == UserID)
                .SingleOrDefaultAsync();

            return user;
        }

        public async Task<string> GetNotificationID(int friendID)
        {
            var user = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.ID == friendID)
                .Select(u => u.NotificationID)
                .SingleOrDefaultAsync();

            return user;
        }

        public async Task<string[]> GetNotificationIDs(int[] friendID)
        {
            var user = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => friendID.Contains(u.ID))
                .Select(u => u.NotificationID)
                .ToArrayAsync();

            return user;
        }

        public async Task<bool> DeactivePreviousUser(SUserRegistrationForm RegisterationForm)
        {
            var user = await mDb.Set<User>().Where(u => u.NotificationID == RegisterationForm.NotificationID.ToString() && u.Activated == true).ToArrayAsync();

            if(user == null)
            {
                return false;
            }

            for(int i = 0; i < user.Length; ++i )
            {
                if (user[i].Model == RegisterationForm.Model && user[i].Device == RegisterationForm.Device)
                {
                    user[i].Activated = false;
                }
                else
                {
                    throw new BusinessRuleViolationException("Same Notification but different device , kind of a cheat ");
                }
            }

            await mDb.SaveChangesAsync();
            return true;
            
        }

        public async Task<int> GetUserCurrentQuestNumber()
        {
            var currentUserQuest = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.ID == mUserSession.ID)
                .Select(u => u.QuestNumber)
                .SingleOrDefaultAsync();

            return currentUserQuest ?? 0 ;    
        }

        public async Task<bool> SaveUserImageUrl(string ImageRelativePath)
        {
            var user = await mDb.Set<User>().FindAsync(mUserSession.ID);

            user.AvatarImagePath = ImageRelativePath;

            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<User> GetUserByUUIDAsNoTracking(string UUID)
        {
            var user = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).SingleOrDefaultAsync();
            return user;
        }

        public async Task<bool> BanUser(int ID)
        {
            var user = mDb.Set<User>().Find(ID);
            user.Activated = false;
            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<bool> CanPurchaseQuest(int QuestNumber , int LastQuestNumber)
        {
            var userStat = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.ID == mUserSession.ID)
                .Select(u => new
                {
                    u.QuestNumber,
                    u.QuestProgress
                }).SingleOrDefaultAsync();

            var userQuestNumber = userStat.QuestNumber ?? -1;
            var questProgress = userStat.QuestProgress;

            //don't let to purchase the last quest  , because already is in the last 
            if (userQuestNumber == LastQuestNumber)
                return false;

            int itemToPurchase = -1;

            if (userQuestNumber == -1)
                itemToPurchase = 1;
            else
            {
                if (questProgress == 0)
                    itemToPurchase = userQuestNumber;
            }


            if (itemToPurchase == QuestNumber)
                return true;
           else
                return false;

        }

        public SQuestUpInfo QuestUpChecking(ref User User, int Prize, int CurrentQuestMax , int NextQuestNumber , int LastQuestNumber )
        {
            SQuestUpInfo info = new SQuestUpInfo();

            if ((User.QuestProgress + Prize >= CurrentQuestMax))
            {
                if (NextQuestNumber > LastQuestNumber)
                    return info;

                var currentQuestNumber = User.QuestNumber;

                User.QuestNumber = NextQuestNumber;
                int remained = (User.QuestProgress + Prize) - CurrentQuestMax;
                User.QuestProgress = remained;
                User.QuestPurchased = false;    

                info.QuestUpMode = QuestUpMode.QuestUpped;
                info.QuestUpNumber = currentQuestNumber ?? -1;
            }
            else
            {
                User.QuestProgress += Prize;

                info.QuestUpMode = QuestUpMode.NotQuestUpped;
                info.QuestUpNumber = Constants.DefaultValues.NotQuestUpped;
            }
            return info;
        }

        public async Task<int> GetCurrentUserQuestNumber()
        {
            var questNumber = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.ID == mUserSession.ID)
                .Select(u => u.QuestNumber).SingleOrDefaultAsync();

            return questNumber ?? -1; 
        }

        public async Task<int> SetQuest(int QuestNumber , bool Purchased)
        {
            var user = await mDb.Set<User>().FindAsync(mUserSession.ID);
            if(user != null)
            {
                user.QuestNumber = QuestNumber;
                user.QuestProgress = 0;
                user.QuestPurchased = Purchased;
                await mDb.SaveChangesAsync();
                return QuestNumber;
            }
            return -1;   
        }
    }
}   