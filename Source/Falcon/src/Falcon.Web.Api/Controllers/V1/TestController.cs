using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        
        private readonly IQuestInMemoryProcessor mQuest;

        public TestController(IQuestInMemoryProcessor QuestInMemory)
        {
            mQuest = QuestInMemory;            
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public IHttpActionResult GetInfo()
        {
            var data = mQuest.GetState();

            return Ok(data);
        }

    }
}