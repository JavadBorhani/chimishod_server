using Falcon.Data.QueryProcessors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.EFCommonContext.DbModel;
using Falcon.EFCommonContext;
using Falcon.Common.Security;
using System.Data.Entity;

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

        public async Task<bool> IsPurchased(int StoreItemId, string Token)
        {
            return await mDb.Set<Order>().AsNoTracking().CountAsync(o => o.UserID == mUserSession.ID && o.StoreID == StoreItemId && o.PurchasedToken == Token) > 0;
        }

        public async  Task<bool> SaveNewPurchase(Order Order)
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
