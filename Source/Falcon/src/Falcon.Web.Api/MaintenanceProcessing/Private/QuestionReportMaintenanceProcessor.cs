using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Report;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class QuestionReportMaintenanceProcessor : IQuestionReportMaintenanceProcessor
    {
        private readonly IQuestionReportQueryProcessor mQuestionReportQuery;
        private readonly IQuestionsQueryProcessor mQuestionsQuery;
        private readonly SGameConfig mGameConfig;

        public QuestionReportMaintenanceProcessor(IQuestionReportQueryProcessor QuestionReportQuery , IQuestionsQueryProcessor QuestionQuery, IGameConfig GameConfig)
        {
            mQuestionReportQuery = QuestionReportQuery;
            mGameConfig = GameConfig.GetState();
            mQuestionsQuery = QuestionQuery;
        }
        public async Task<bool> ReportQuestion(SReportedQuestion Reported)
        {
            var reportCount = await mQuestionsQuery.GetQuestionReportCount(Reported.QuestionID);

            if(reportCount >= mGameConfig.MaxReportCount)
            {
                await mQuestionsQuery.BanQuestion(Reported.QuestionID);
            }

            var result  = await mQuestionReportQuery.ReportQuestion(Reported);

            return result;
        }
    }
}