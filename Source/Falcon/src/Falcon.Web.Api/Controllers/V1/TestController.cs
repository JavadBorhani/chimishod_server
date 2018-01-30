using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Api.Utilities.RestClient;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {


        private readonly INotificationSystem mNotification;

        private readonly IRestClient mRest;
        public TestController(IRestClient RestClient , INotificationSystem NotificationSystem)
        {
            mNotification = NotificationSystem;
            mRest = RestClient;
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public async Task<string> GetInfo()
        {
            var result = await mNotification.SendToFriend(new string[]
            {
                "d99ac7d4-c0fa-4dd7-94a8-97174c619b9f",
                "c3e9d541-c0f7-4dc1-8c32-9f4222db0e40",
                "9745bd46-df22-4ff7-b113-4cad9483c66b",
                "77acbb38-a33d-49be-9207-23822879c161",
            });

            if (result != null)
                return result.id;
            else
                return  null;    
        }
       
    }
}