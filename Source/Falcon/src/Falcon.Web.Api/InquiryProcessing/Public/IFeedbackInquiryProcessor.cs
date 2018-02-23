using Falcon.Web.Models.Api.Feedback;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IFeedbackInquiryProcessor
    {
        Task<SFeedbackType[]> GetFeedbackTypes();
    }
}