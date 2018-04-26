using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class SentInboxController : FalconApiController
    {
        private readonly ISentInquiryProcessor mSentInquiry;
        private readonly IDateTime mDateTime;
        private readonly IPagedDataRequestFactory mPageDataRequest;
        private readonly SApplicationState mApplicationState;
        
        public SentInboxController(ISentInquiryProcessor SentInquiry , 
            IDateTime DateTime , 
            IPagedDataRequestFactory PageDataRequest , 
            IGlobalApplicationState AppState)
        {
            mApplicationState = AppState.GetState();
            mPageDataRequest = PageDataRequest;
            mSentInquiry = SentInquiry;
            mDateTime = DateTime;
        }

        [ResponseType(typeof(PagedDataInquiryResponse<SQuestionWithAnswerState>))]
        [Route("v2/Message/Sent/{PageNumber}")]
        [HttpPost]
        public async Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetSentList(int PageNumber)
        {

            var pages = mPageDataRequest.Create(PageNumber, mApplicationState.Paging_DefaultPageSize);
            var questions = await mSentInquiry.GetUserSentMessageList(pages);

            return questions;

        }

        [ResponseType(typeof(PagedDataInquiryResponse<SQuestionWithAnswerState>))]
        [Route("v2/Message/Inbox/{PageNumber}")]
        [HttpPost]
        public async Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetInboxList(int PageNumber)
        {
            var pages = mPageDataRequest.Create(PageNumber, mApplicationState.Paging_DefaultPageSize);
            var questions = await mSentInquiry.GetUserInboxMessageList(pages);

            return questions;
        }

    }
}
