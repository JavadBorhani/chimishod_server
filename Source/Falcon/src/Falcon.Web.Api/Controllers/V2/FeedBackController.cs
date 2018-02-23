using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Feedback;
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
        [ResponseType(typeof(SFeedbackType[]))]
        [HttpPost]
        public async Task<SFeedbackType[]> GetFeedbackList()
        {
            var response = await mFeedbackInquiry.GetFeedbackTypes();
            return response;
        }

        [Route("v2/Feedback/Post")]
        [ResponseType(typeof(IHttpActionResult))]
        [HttpPost]
        public async Task<IHttpActionResult> SendFeedback(SFeedback Inquiry)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var response = await mFeedbackMaintenance.SaveFeedback(Inquiry);

            return Ok(response);

        }

    }
}
