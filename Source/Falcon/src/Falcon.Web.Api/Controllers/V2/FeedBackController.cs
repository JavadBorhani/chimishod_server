using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    public class FeedBackController : ApiController
    {
        private readonly IFeedbackMaintenanceProcessor mFeedbackMaintenance;
        private readonly IFeedbackInquiryProcessor mFeedbackInquiry;

        public FeedBackController(IFeedbackMaintenanceProcessor FeedbackMaintenance , IFeedbackInquiryProcessor FeedbackInquiryProcessor)
        {
            mFeedbackMaintenance = FeedbackMaintenance;
            mFeedbackInquiry = FeedbackInquiryProcessor;
        }


        [Route("v2/Feedback/Get")]
        [ResponseType(typeof(bool))]
        [HttpPost]
        public async Task<bool> GetFeedbackList()
        {
            return false;
        }

        [Route("v2/Feedback/Post")]
        [ResponseType(typeof(bool))]
        [HttpPost]
        public async Task<bool> SendFeedback()
        {
            return false;
        }

    }
}
