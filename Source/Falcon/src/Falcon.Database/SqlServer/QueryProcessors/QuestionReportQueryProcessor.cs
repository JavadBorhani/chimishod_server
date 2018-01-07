using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Data.Entity;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestionReportQueryProcessor : IQuestionReportQueryProcessor
    {
        private readonly IDbContext mDb;

        public QuestionReportQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }

        public async Task<int> GetReportCountByQuestionID(int QuestionID)
        {
            throw new NotImplementedException();
        }

        public async Task<ReportType[]> GetReportTypeList()
        {
            var reportTypes = await mDb.Set<ReportType>().ToArrayAsync();
            return reportTypes;
        }
    }
}
