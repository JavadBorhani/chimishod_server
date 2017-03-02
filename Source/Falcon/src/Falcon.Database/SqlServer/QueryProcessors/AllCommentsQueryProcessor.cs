using Falcon.Data.QueryProcessors;
using System.Linq;
using Falcon.Data;
using Falcon.EFCommonContext.DbModel;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AllCommentsQueryProcessor : IAllCommentsQueryProcessor
    {
        private readonly IDbContext _dbContext;

        public AllCommentsQueryProcessor(IDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public QueryResult<Comment> GetComments(PagedDataRequest requestInfo)
        {
            var query = _dbContext.Set<Comment>();

            var totalItemCount = query.Count();

            var startIndex = ResultPagingUtility.CalculateStartIndex(requestInfo.PageNumber, requestInfo.PageSize);

            var comments = query.OrderBy(x => x.ID).Skip(startIndex).Take(requestInfo.PageSize).ToList();

            var queryResult = new QueryResult<Comment>(comments, totalItemCount, requestInfo.PageSize);

            return queryResult;
        }
    }
}
