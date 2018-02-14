using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Answer;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AnswerQueryProcessor : IAnswerQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;
        public AnswerQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
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

        public async Task<bool> SaveYesNoAnswer(SYesNoAnswer Response)
        {
            var answer = mDb.Set<Answer>().Add(new Answer
            {
                UserID = mUserSession.ID,
                QuestionID = Response.QuestionID,
                YesState = Response.IsYes,
                NoState = !Response.IsYes,
                CreatedDate = mDateTime.Now
            });

            try
            {
                await mDb.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> SaveLikeDislikeAnswer(SLikeDislikeAnswer Response)
        {
            var answer = await mDb.Set<Answer>()
                .Where(a => a.UserID == mUserSession.ID && a.QuestionID == Response.QuestionID)
                .SingleOrDefaultAsync();

            if(answer != null)
            {
                answer.Liked = Response.IsLiked;
                answer.Dislike = !Response.IsLiked;

                await mDb.SaveChangesAsync();
                return true;
            }

            return false;   
        }
    }
}
