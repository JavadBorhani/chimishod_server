using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System;
using Falcon.Common;

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
            //TODO : Checkout Threading 
            var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();
            user.TotalCoin += Coin;

            await mDb.SaveChangesAsync();
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
            user.TotalCoin -= Coin;

            await mDb.SaveChangesAsync();
            return user.TotalCoin;
        }
    }
}
