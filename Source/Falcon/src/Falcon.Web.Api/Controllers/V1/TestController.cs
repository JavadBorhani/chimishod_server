using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
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
        public IHttpActionResult GetInfo()
        {
            return null;
        }

    }
}