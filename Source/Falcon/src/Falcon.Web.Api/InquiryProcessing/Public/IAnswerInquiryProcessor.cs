using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IAnswerInquiryProcessor
    {
        Task<int[]> GetUserAnswerQuestions(int UserID);
    }
}