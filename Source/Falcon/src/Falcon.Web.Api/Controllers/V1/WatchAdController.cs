using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class WatchAdController : FalconApiController
    {
        private readonly IWatchAdMaintenanceProcessor mWatchAdMaintenanceProcessor;

        public WatchAdController(IWatchAdMaintenanceProcessor WatchAdMaintenanceProcessor)
        {
            mWatchAdMaintenanceProcessor = WatchAdMaintenanceProcessor;
        }

        [Route("v2/WatchAd/Verification")]
        [HttpPost]
        [ResponseType(typeof(int))]
        public async Task<IHttpActionResult> ValidateWatchAd([FromBody] SWatchAdValidation WatchAdValidation)
        {
            if(!ModelState.IsValid)
                return null;

            var totalCoin = await mWatchAdMaintenanceProcessor.ValidateWatchAd(WatchAdValidation);

            return Ok(totalCoin);   
        }

    }
}