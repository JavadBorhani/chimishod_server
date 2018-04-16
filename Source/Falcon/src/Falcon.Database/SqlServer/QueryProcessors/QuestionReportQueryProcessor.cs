using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Report;
using System.Data.Entity;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestionReportQueryProcessor : IQuestionReportQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;

        public QuestionReportQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }


        public async Task<ReportType[]> GetReportTypeList()
        {
            var reportTypes = await mDb.Set<ReportType>().ToArrayAsync();
            return reportTypes;
        }

        public async Task<bool> ReportQuestion(SReportedQuestion Question)
        {
            var exits = await HasReportedByUser(mUserSession.ID, Question.QuestionID);
            if (exits)
                return false;

            var newReport = new ReportedQuestion
            {
                QuestionID = Question.QuestionID,
                UserID = mUserSession.ID,
                ReportTypeID = Question.ReportID,
                CreatedDate = mDateTime.Now
            };

            mDb.Set<ReportedQuestion>().Add(newReport);

            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<bool> HasReportedByUser(int UserID, int QuestoinID)
        {
            var response = await mDb.Set<ReportedQuestion>()
                .AsNoTracking()
                .AnyAsync(u => u.UserID == UserID && u.QuestionID == QuestoinID);

            return response;
        }
    }
}
