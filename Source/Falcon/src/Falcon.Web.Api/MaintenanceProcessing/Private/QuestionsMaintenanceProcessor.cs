using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class QuestionsMaintenanceProcessor : IQuestionsMaintenanceProcessor
    {
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        public QuestionsMaintenanceProcessor(IQuestionsQueryProcessor QuestionQuery)
        {
            mQuestionQuery = QuestionQuery;
        }

    }
}