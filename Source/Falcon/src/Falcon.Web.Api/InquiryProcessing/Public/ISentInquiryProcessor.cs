using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface ISentInquiryProcessor
    {
        Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetUserSentMessageList(PagedDataRequest RequestInfo);
        Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetUserInboxMessageList(PagedDataRequest RequestInfo);

    }
}