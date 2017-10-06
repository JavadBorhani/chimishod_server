using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AnswerQueryProcessor : IAnswerQueryProcessor
    {
        private readonly IDbContext mDb;
        public AnswerQueryProcessor(IDbContext Database)
        {
            mDb = Database;

        }
        public async Task<int[]> GetUserAnsweredIds(int UserID)
        {
            var data = await mDb.Set<Answer>()
                .AsNoTracking()
                .Where(a => a.UserID == UserID)
                .Select(a => a.ID)
                .ToArrayAsync();

            return data;
        }
    }
}
