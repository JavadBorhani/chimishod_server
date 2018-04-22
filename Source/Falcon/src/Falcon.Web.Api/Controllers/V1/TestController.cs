using Falcon.Web.Api.Utilities;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        private readonly INetworkUtils mNetUtils;
        
        public TestController(INetworkUtils NetworkUtil)
        {
            mNetUtils = NetworkUtil;
        }

        [Route("v2/TestController/")]
        [HttpPost]
        public IHttpActionResult GetInfo()
        {
            var item = mNetUtils.IsIpInternal();
            return Ok();
        }

    }
}