using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IAnswerInquiryProcessor
    {
        Task<List<int>> GetUserAnswerQuestions(int UserID);
    }
}