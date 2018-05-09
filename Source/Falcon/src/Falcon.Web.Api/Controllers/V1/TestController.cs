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

        [Route("v2/TestController/{QuestNumber}/{QuestProgress}/{State}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetInfo(int QuestNumber , int QuestProgress , int State)
        {
            return null;    
        }
    }
}