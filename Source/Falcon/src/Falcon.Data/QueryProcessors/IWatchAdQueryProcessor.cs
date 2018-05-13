using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IWatchAdQueryProcessor
    {
        Task<bool> IsExists(string WatchAdId);
        Task<bool> IsExists(string WatchAdId , int LevelNumber);
        Task<WatchedAd> GetByWatchAdID(string WatchAdID);
        Task<bool> AddWatchedInfo(SWatchedAd WatchedAd);
    }
}
