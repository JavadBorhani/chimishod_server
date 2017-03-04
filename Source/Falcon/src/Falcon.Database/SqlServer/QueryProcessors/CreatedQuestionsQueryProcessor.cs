using Falcon.Data.QueryProcessors;
using System.Threading.Tasks;
using Falcon.Data;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CreatedQuestionsQueryProcessor : ICreatedQuestionsQueryProcessor
    {
        private readonly IDbContext mDb; 
        public CreatedQuestionsQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }
        public Task<QueryResult<SCreatedQuestion>> GetCreatedQuestions(PagedDataRequest requestInfo, int UserID)
        {
            return null;
        }
    }
}
