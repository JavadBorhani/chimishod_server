using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{

    public class AnswerInquiryProcessor : IAnswerInquiryProcessor
    {

        private readonly IAnswerQueryProcessor mAnswerQueryProcessor;
        public AnswerInquiryProcessor(IAnswerQueryProcessor AnswerQueryProcessor)
        {
            mAnswerQueryProcessor = AnswerQueryProcessor; 
        }
        public async Task<int[]> GetUserAnswerQuestions(int UserID)
        {
            var data = await mAnswerQueryProcessor.GetUserAnsweredIds(UserID);
            return data;
        }

    }
}