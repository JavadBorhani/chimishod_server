using Falcon.Data.QueryProcessors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.EFCommonContext.DbModel;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class StoresQueryProcessor : IStoresQueryProcessor
    {
        public Task<MarketInfo> GetMarketInfoByID(int Id)
        {
            throw new NotImplementedException();
        }

        public Task<Store> GetStoreItemByID(int Id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> IsPurchased(int StoreItemId, string Token)
        {
            throw new NotImplementedException();
        }
    }
}
