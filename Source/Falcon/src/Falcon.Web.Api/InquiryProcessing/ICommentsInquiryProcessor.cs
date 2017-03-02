using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.InquiryProcessing
{
    public interface ICommentsInquiryProcessor
    {
        PagedDataInquiryResponse<SComment> GetComments(PagedDataRequest requestInfo);
    }
}