﻿using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class StoresQueryProcessor : IStoresQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        public StoresQueryProcessor(IDbContext Database , IWebUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
        public async Task<MarketInfo> GetMarketInfoByID(int Id)
        {
            return await mDb.Set<MarketInfo>().AsNoTracking().Where(mi => mi.ID == Id).SingleOrDefaultAsync();
        }

        public async Task<Store> GetStoreItemByID(int Id)
        {
            return await mDb.Set<Store>().AsNoTracking().Where(s => s.ID == Id).SingleOrDefaultAsync();
        }

        public async Task<Store[]> GetStoreListByMarketId(int Id)
        {
            return await mDb.Set<Store>().AsNoTracking().Where(s => s.MarketID == Id).ToArrayAsync();
        }

        public async Task<bool> IsPurchased(int StoreItemId, string Token)
        {
            return await mDb.Set<Order>()
                .AsNoTracking().
                CountAsync(o => o.UserID == mUserSession.ID && o.StoreID == StoreItemId && o.PurchasedToken == Token && o.IsFailed == false) > 0;
        }

        public async Task<bool> SaveNewPurchase(Order Order)
        {
            if(Order != null)
            {
                mDb.Set<Order>().Add(Order);
                await mDb.SaveChangesAsync();
                return true;
            }
            else
            {
                return false;   
            }
        }
    }
}
