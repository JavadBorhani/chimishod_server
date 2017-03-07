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

        public CommentsQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }
        public async Task<QueryResult<Comment>> GetComments(PagedDataRequest requestInfo , int QuestionID)
        {
            var query = mDb.Set<Comment>().AsNoTracking()
                .Where(comment => comment.QuestionID == QuestionID && comment.IsVerified == true)
                .Include( comment => comment.User);
            
            var totalItemCount = await query.CountAsync();

            var startIndex = ResultPagingUtility.CalculateStartIndex(requestInfo.PageNumber, requestInfo.PageSize);

            var comments = await query.OrderBy(x => x.ID).Skip(startIndex).Take(requestInfo.PageSize).ToListAsync();

            var queryResult = new QueryResult<Comment>(comments, totalItemCount, requestInfo.PageSize);

            return queryResult;
        }
    }
}
