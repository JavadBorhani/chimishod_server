using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Report;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class QuestionReportMaintenanceProcessor : IQuestionReportMaintenanceProcessor
    {
        private readonly IQuestionReportQueryProcessor mQuestionReportQuery;
        private readonly IQuestionsQueryProcessor mQuestionsQuery;
        private readonly IAnswerMaintenanceProcessor mAnswerMaintenanceProcessor;
        private readonly IReportInMemory mReportInMemory;
        private readonly INotificationMaintenanceProcessor mNotificationMaintenance;
        private readonly IUsersMaintenanceProcessor mUsersMaintenance;

        public QuestionReportMaintenanceProcessor(
            IQuestionReportQueryProcessor QuestionReportQuery , 
            IGameConfig GameConfig , 
            IQuestionsQueryProcessor QuestionQuery,
            IAnswerMaintenanceProcessor AnswerMaintenance , 
            IReportInMemory ReportInMemory , 
            INotificationMaintenanceProcessor NotificationMaintenance , 
            IUsersMaintenanceProcessor UserMaintenance)
        {
            mQuestionReportQuery = QuestionReportQuery;
            mQuestionsQuery = QuestionQuery;
            mAnswerMaintenanceProcessor = AnswerMaintenance;
            mReportInMemory = ReportInMemory;
            mNotificationMaintenance = NotificationMaintenance;
            mUsersMaintenance = UserMaintenance;
        }
        
        public async Task<bool> ReportQuestion(SReportedQuestion Reported)
        {
            var reportCount = await mQuestionsQuery.GetQuestionReportCount(Reported.QuestionID);

            var reportInfo = mReportInMemory.GetReportByID(Reported.ReportID);

            if(reportInfo != null)
            {
                if (reportCount + 1 >= reportInfo.ReportCountToFilter)
                {
                    var response = await mQuestionsQuery.BanQuestion(Reported.QuestionID);

                    if (response)
                    {
                        var notifysent = await mNotificationMaintenance.BanQuestionToAllClients(new List<int>{ Reported.QuestionID });
                        var result = await mQuestionReportQuery.ReportQuestion(Reported);

                        if (result)
                        {
                            var answer = await mAnswerMaintenanceProcessor.SaveReportedAnswer(Reported.QuestionID);
                        }

                        if (reportInfo.ShouldBanUser)
                        {
                            await mUsersMaintenance.BanUserByQuestionID(Reported.QuestionID);
                        }

                        return true;
                    }
                }
            }
            return false;
        }


    }
}