using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System;
using Falcon.Common;
using System.Data.Entity.Infrastructure;
using Falcon.Web.Common.Memmory;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserQueryProcessor : IUserQueryProcessor
    {

        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly IDateTime mDateTime;
        private readonly IMemoryStore mStore;
        public UserQueryProcessor(IDbContext Database , IWebUserSession UserSession , IDateTime DateTime , IMemoryStore Store)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
            mStore = Store; 
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
                    mStore.SaveState(GlobalVariables.ConcurrencyIssueResolved, true);
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
                    mStore.SaveState(GlobalVariables.ConcurrencyIssueResolved, true);
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    SaveFailed = true;
                    ex.Entries.Single().Reload();
                }

            } while (SaveFailed);

            return user.TotalCoin;
        }

        public async Task<bool> UpdateLevel(int NewLevelProgress, int LevelNumber)
        {
            throw new NotImplementedException();
        }

        private void LevelUpChecking(ref User user, int levelCeil, int Prize, int nextLevelNumber)
        {
            if (user.LevelProgress + Prize >= levelCeil)
            {
                user.CurrentLevelNumber = nextLevelNumber;
                int remained = (user.LevelProgress + Prize) - levelCeil;
                user.LevelProgress = remained;
            }
            else
            {
                user.LevelProgress += Prize;
            }
        }

        public async Task<bool> LevelExits(int LevelNumber)
        {
            var exists = await mDb.Set<Level>().AsNoTracking().CountAsync(l => l.LevelNumber == LevelNumber) > 0;
            return exists;
        }

        public async Task<int> GetLevelPrize(int LevelNumber)
        {
            int prize = await mDb.Set<Level>().AsNoTracking().Where(l => l.LevelNumber == LevelNumber).Select(l => l.Star).SingleOrDefaultAsync();
            return prize;
        }
    }
}   
