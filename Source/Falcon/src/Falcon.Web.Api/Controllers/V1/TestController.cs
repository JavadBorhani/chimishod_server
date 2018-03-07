using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{

    public class TestController : FalconApiController
    {
        
        public TestController()
        {
            
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public  IHttpActionResult GetInfo()
        {
            return Ok(WebContextModelFactory.ConnectionCount);
        }

    }
}