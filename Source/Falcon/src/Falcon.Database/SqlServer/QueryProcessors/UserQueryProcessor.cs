using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.User;
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

        public UserQueryProcessor(IDbContext Database , IWebUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }

        public async Task<int> IncreaseCoin(int Coin)
        {
            if (Coin < 0)
                return -1;

            var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();

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

        public async Task<SUserCount> CreateUser()
        {
            throw new NotImplementedException();
        }

        public async Task<SUserCount> LoadUser()
        {
            throw new NotImplementedException();
        }

        public async Task<bool> LevelExits(int LevelNumber)
        {
            //var exists = await mDb.Set<Level>().AsNoTracking().CountAsync(l => l.LevelNumber == LevelNumber) > 0;
            //return exists;
            return false;
        }

        public async Task<int> GetLevelPrize(int LevelNumber)
        {
            //int prize = await mDb.Set<Level>().AsNoTracking().Where(l => l.LevelNumber == LevelNumber).Select(l => l.Star).SingleOrDefaultAsync();
            //return prize;
            return 1;
        }

        public async Task<SLevelUpInfo> UpdateLevel(int Prize)
        {
            var player = await mDb.Set<User>().FindAsync(mUserSession.ID);
            SLevelUpInfo level;
            bool SaveFailed = false;

            do
            {
                SaveFailed = false;
                //level = LevelUpChecking(ref player, player.Level.ScoreCeil, Prize, (player.CurrentLevelNumber ?? 0) + 1);
                level = new SLevelUpInfo();
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

        private bool CheckIfNeedAnotherLevelUp(ref User User)
        {
            //if (User.LevelProgress >= User.Level.ScoreCeil)
            //    return true;
            return false;
        }
        private SLevelUpInfo LevelUpChecking(ref User User, int LevelCeil, int Prize, int NextLevelNumber)
        {
            SLevelUpInfo info = new SLevelUpInfo();

            //if (User.LevelProgress + Prize >= LevelCeil)
            //{
            //    User.CurrentLevelNumber = NextLevelNumber;
            //    int remained = (User.LevelProgress + Prize) - LevelCeil;
            //    User.LevelProgress = remained;

            //    info.LevelUpMode = LevelUpMode.LeveledUp;
            //    info.LevelUpNumber = NextLevelNumber;
            //}
            //else
            //{
            //    User.LevelProgress += Prize;

            //    info.LevelUpMode = LevelUpMode.NotLeveledUp;
            //    info.LevelUpNumber = Constants.DefaultValues.NoLevelUp;
            //}
            return info;
        }

        public async Task<SUserCount> GetUserCountInfo(int UserID)
        {
            //var data = await mDb.Set<UserCount>()
            //                .AsNoTracking()
            //                .Where(u => u.UserID == UserID)
            //                .SingleOrDefaultAsync();
            return null;
        }
        public async Task<bool> UpdateLastSeenDateTime()
        {
            var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();
            user.PrevLastSeenDateTime = user.LastSeenDateTime;
            user.LastSeenDateTime = mDateTime.Now;
            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UpdateLastSeenDateTimeToNow()
        {
            var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();
            user.PrevLastSeenDateTime = mDateTime.Now;
            user.LastSeenDateTime = mDateTime.Now;
            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<int> GetDWMCount()
        {
            var count = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => u.ID == mUserSession.ID)
                .Select(u => u.DWMCount)
                .SingleOrDefaultAsync();
            return count;
        }


    }
}   
