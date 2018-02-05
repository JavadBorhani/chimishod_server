using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {

        public TestController()
        {

        }

        [Route("v2/TestController/")]
        [HttpGet]
        public async Task<string> GetInfo()
        {
            //var data = await mNotification.SendFriendRequestNotification(1 , 7);
            //return data.ToString();

            return null;
        }

    }
}