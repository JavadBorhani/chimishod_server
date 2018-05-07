using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        //private readonly IQuestsInquiryProcessor mQuesktsInquiryProcessor;
        
        public TestController(IQuestsInquiryProcessor QuestsInquiry)
        {
            //mQuestsInquiryProcessor = QuestsInquiry;
        }

        [Route("v2/TestController/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetInfo()
        {
            //var items = await mQuestsInquiryProcessor.GetFinaleQuestDetail();
            //return Ok(items);

            return null;
        }

    }
}