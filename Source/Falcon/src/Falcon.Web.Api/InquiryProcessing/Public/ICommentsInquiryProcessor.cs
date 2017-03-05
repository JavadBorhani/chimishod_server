using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface ICommentsInquiryProcessor
    {
        Task<PagedDataInquiryResponse<SComment>> GetComments(PagedDataRequest requestInfo , int QuestionID);
    }
}