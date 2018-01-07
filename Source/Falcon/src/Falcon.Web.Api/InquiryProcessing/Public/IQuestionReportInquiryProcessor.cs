using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IQuestionReportInquiryProcessor
    {
        Task<SReportType[]> GetReportList();
    }
}