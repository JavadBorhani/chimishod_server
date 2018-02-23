using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {

        public TestController(IFeedbackInquiryProcessor inquiry , IFeedbackMaintenanceProcessor Maintenance , IFeedbackQueryProcessor query)
        {
            int x = 10;             
        }

        [Route("v2/TestController/")]
        [HttpGet]
        public IHttpActionResult GetInfo()
        {
            return null;
        }

    }
}