using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IWatchAdManager
    {
        Task<bool> ValidateWatchAd(SWatchAdValidation WatchAdValidation);
        Task<bool> ValidateLevelUp(SWatchAdValidation WatchAdValidation);
    }
}