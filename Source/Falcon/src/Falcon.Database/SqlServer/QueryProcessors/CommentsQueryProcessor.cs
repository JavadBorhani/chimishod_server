using Falcon.Data.QueryProcessors;
using System.Linq;
using Falcon.Data;
using Falcon.EFCommonContext.DbModel;
using Falcon.EFCommonContext;
using System.Threading.Tasks;
using System.Data.Entity;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class CommentsQueryProcessor : ICommentsQueryProcessor
    {
        private readonly IDbContext mDb;

        public CommentsQueryProcessor(IDbContext dbContext)
        {
            mDb = dbContext;
        }
        public async Task<QueryResult<Comment>> GetComments(PagedDataRequest requestInfo)
        {
            var query = mDb.Set<Comment>();

            var totalItemCount = await query.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(requestInfo.PageNumber, requestInfo.PageSize);

            var comments = query.OrderBy(x => x.ID).Skip(startIndex).Take(requestInfo.PageSize).ToList();

            var queryResult = new QueryResult<Comment>(comments, totalItemCount, requestInfo.PageSize);

            return queryResult;
        }
    }
}
