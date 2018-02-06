using Falcon.Common.Security;
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
        private readonly IUserSession mUserSession;
        public AnswerQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;

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

        public async Task<Answer[]> GetUserAnswers(int[] QuestionIds)
        {
            var answers = await mDb.Set<Answer>()
                .AsNoTracking().Where(a => a.UserID == mUserSession.ID && QuestionIds.Contains(a.QuestionID))
                .ToArrayAsync();

            return answers;
        }
    }
}
