using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;

namespace Falcon.Web.Api.Controllers.V2
{
    public class SentInboxController : FalconApiController
    {
        private readonly ISentInquiryProcessor mSentInquiry;
        
        public SentInboxController(ISentInquiryProcessor SentInquiry)
        {
            mSentInquiry = SentInquiry;
        }



    }
}
