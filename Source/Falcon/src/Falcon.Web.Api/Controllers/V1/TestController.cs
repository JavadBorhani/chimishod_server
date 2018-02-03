using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Api.Utilities.RestClient.Engine;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {


        private readonly INotificationMaintenanceProcessor mNotification;
        
        public TestController(IRestClientEngine Engine, INotificationMaintenanceProcessor NotificationSystem)
        {
            mNotification = NotificationSystem;
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public async Task<string> GetInfo()
        {
            var data = await mNotification.SendFriendRequestNotification(7);
            return data.ToString();
        }

    }
}