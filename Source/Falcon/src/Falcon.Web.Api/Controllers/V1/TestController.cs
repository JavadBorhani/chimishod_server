using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        private readonly IQuestsQueryProcessor mQuestsQuery;
        
        public TestController(IQuestsQueryProcessor QuestsQuery)
        {
            mQuestsQuery = QuestsQuery; 
        }

        [Route("v2/TestController/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetInfo()
        {
            return null;
        }

    }
}