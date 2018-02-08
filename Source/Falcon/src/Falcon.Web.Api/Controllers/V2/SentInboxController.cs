using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    public class SentInboxController : FalconApiController
    {
        private readonly ISentInquiryProcessor mSentInquiry;
        private readonly IDateTime mDateTime;
        
        public SentInboxController(ISentInquiryProcessor SentInquiry , IDateTime DateTime)
        {
            mSentInquiry = SentInquiry;
            mDateTime = DateTime;
        }

        [ResponseType(typeof(DataWithServerTime<SQuestionWithAnswerState>))]
        [Route("Message/Sent")]
        [HttpPost]
        public async Task<DataWithServerTime<SQuestionWithAnswerState>> GetSentList(int PageNumber)
        {
            return null;
        }

        [ResponseType(typeof(DataWithServerTime<SQuestionWithAnswerState>))]
        [Route("Message/Inbox")]
        [HttpPost]
        public async Task<IHttpActionResult> GetInboxList(int PageNumber)
        {
            return null;
        }



    }
}
