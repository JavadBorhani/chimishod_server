using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestionsInquiryProcessor : IQuestionsInquiryProcessor
    {
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        
        public QuestionsInquiryProcessor(IQuestionsQueryProcessor QuestionQueryProcessor)
        {
            mQuestionQuery = QuestionQueryProcessor;
        }

        public async Task<bool> PrepareQuestionList(int CategoryID)
        {
            //writing strategies
            return false;    
        }
    }
}