using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IStoresQueryProcessor
    {
        Task<MarketInfo> GetMarketInfoByID(int Id);
        Task<Store> GetStoreItemByID(int Id);
        Task<bool> IsPurchased(int StoreItemId , string Token);
        Task<bool> SaveNewPurchase(Order Order);
        Task<Store[]> GetStoreListByMarketId(int Id);
    }
}
