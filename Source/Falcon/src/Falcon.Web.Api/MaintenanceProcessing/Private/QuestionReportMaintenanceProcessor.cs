using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Report;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class QuestionReportMaintenanceProcessor : IQuestionReportMaintenanceProcessor
    {
        private readonly IQuestionReportQueryProcessor mQuestionReportQuery;
        public QuestionReportMaintenanceProcessor(IQuestionReportQueryProcessor QuestionReportQuery)
        {
            mQuestionReportQuery = QuestionReportQuery;
        }
        public async Task<bool> ReportQuestion(SReportedQuestion Reported)
        {
            var reportCount = await mQuestionReportQuery.GetReportCountByQuestionID(Reported.QuestionID);

            return false;
            //todo: Write logic of reported question here 


            //var reportExists = await mDb.Set<ReportedQuestion>().Where(rq => rq.UserID == mUserSession.ID && rq.QuestionID == QuestionID).Select(rq => rq.ID).SingleOrDefaultAsync();
            //var questionIDExists = await mDb.Set<Question>().CountAsync(q => q.ID == QuestionID) > 0;
            //var reportIDExists = await mDb.Set<ReportType>().CountAsync(rt => rt.ID == ReportID) > 0;

            //if (reportExists == 0)
            //{
            //    if (questionIDExists && reportIDExists)
            //    {
            //        var newReport = new ReportedQuestion
            //        {
            //            QuestionID = QuestionID,
            //            UserID = mUserSession.ID,
            //            ReportTypeID = ReportID,
            //            CreatedDate = mDateTime.Now
            //        };
            //        mDb.Set<ReportedQuestion>().Add(newReport);
            //        await mDb.SaveChangesAsync();

            //        return Response(HttpStatusCode.OK);
            //    }
            //    else
            //    {
            //        return Response(HttpStatusCode.Unauthorized);
            //    }
            //}
            //else
            //{
            //    return Response(HttpStatusCode.Conflict);
            //}
        }
    }
}