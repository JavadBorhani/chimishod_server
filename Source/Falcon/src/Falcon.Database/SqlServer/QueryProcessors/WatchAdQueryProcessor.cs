using Falcon.Data.QueryProcessors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.EFCommonContext.DbModel;
using Falcon.EFCommonContext;
using Falcon.Common;
using System.Data.Entity;
using Falcon.Web.Models.Api;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class WatchAdQueryProcessor : IWatchAdQueryProcessor
    {

        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public WatchAdQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDb = Database;
            mDateTime = DateTime;
        }
        public async Task<bool> AddWatchedInfo(SWatchedAd newWatchedAd)
        {

            mDb.Set<WatchedAd>().Add(new WatchedAd
            {
                WatchAdId = newWatchedAd.WatchAdId,
                InsertDate = newWatchedAd.InsertDate,
                WatchAdProviderId = newWatchedAd.WatchAdProviderId,
                UserID = newWatchedAd.UserID
            });

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<bool> IsExists(string WatchAdId)
        {
            return await mDb.Set<WatchedAd>().CountAsync(wa => wa.WatchAdId == WatchAdId) > 0 ;
        }
    }
}
