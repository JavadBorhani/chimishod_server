using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class WatchAdQueryProcessor : IWatchAdQueryProcessor
    {

        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;

        public WatchAdQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
        }

        public async Task<bool> AddWatchedInfo(SWatchedAd newWatchedAd)
        {

            mDb.Set<WatchedAd>().Add(new WatchedAd
            {
                UserID = newWatchedAd.UserID , 
                WatchAdId = newWatchedAd.WatchAdId,
                WatchAdProviderId = newWatchedAd.WatchAdProviderId,
                IsLevel = newWatchedAd.IsLevel,
                LevelNumber = newWatchedAd.LevelNumber,
                Consumed = newWatchedAd.Consumed,
                InsertDate = newWatchedAd.InsertDate,
                UpdatedDate = newWatchedAd.UpdatedDate,
            });

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<bool> IsExists(string WatchAdId)
        {
            var response = await mDb.Set<WatchedAd>()
                .AsNoTracking()
                .AnyAsync(wa => wa.WatchAdId == WatchAdId);

            return response;
        }

        public async Task<WatchedAd> GetByWatchAdID(string WatchAdID)
        {
            var response = await mDb.Set<WatchedAd>()
                .AsNoTracking()
                .Where(u => u.WatchAdId == WatchAdID)
                .SingleOrDefaultAsync();

            return response;
        }

        public async Task<bool> IsExists(string WatchAdId, int LevelNumber)
        {
            var response = await mDb.Set<WatchedAd>()
             .AsNoTracking()
             .AnyAsync(wa => wa.WatchAdId == WatchAdId || (wa.LevelNumber == LevelNumber && wa.UserID == mUserSession.ID));

            return response;
        }
    }
}
