using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class MarketInfoQueryProcessor : IMarketInfoQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime; 

        public MarketInfoQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDb = Database;
            mDateTime = DateTime;
        }
        public async Task<bool> IsExpired(int MarketId)
        {
            var expireTime = await mDb.Set<MarketInfo>().AsNoTracking().Where(m => m.ID == MarketId).Select(m => m.ExpireAt).SingleOrDefaultAsync();
            return mDateTime.Now > expireTime;
        }

        public async Task AddExpireTimeByMiliseconds(int MarketId , int Seconds)
        {
            
            var item = await mDb.Set<MarketInfo>().FindAsync(MarketId);
            if(item != null)
            {
                item.ExpireAt = mDateTime.Now.AddSeconds(Seconds - Constants.DefaultValues.LatencyNumber);
                await mDb.SaveChangesAsync();
            }
        }

        public async Task SaveNewVerificationData(int MarketId, string AccessToken, string RefreshToken, long ExpiresIn)
        {
            var item = await mDb.Set<MarketInfo>().FindAsync(MarketId);
            if(item != null)
            {
                item.AccessToken = AccessToken;
                item.RefreshToken = RefreshToken;
                item.ExpireAt = mDateTime.Now.AddSeconds(ExpiresIn - Constants.DefaultValues.LatencyNumber);
                await mDb.SaveChangesAsync();
            }
        }

        public async Task<int> GetMarketIdByMarketKey(int Key)
        {
            int id = await mDb.Set<MarketInfo>().AsNoTracking().Where(mi => mi.MarketKey == Key).Select(mi => mi.ID).SingleOrDefaultAsync();
            return id;  
        }
    }
}
