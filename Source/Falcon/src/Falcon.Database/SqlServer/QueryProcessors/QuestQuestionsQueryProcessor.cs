using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Quest;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestQuestionsQueryProcessor : IQuestQuestionsQueryProcessor
    {
        private readonly IUserSession mUserSession;
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public QuestQuestionsQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }



        public async Task<bool> SaveQuestQuestionAnswer(SQuestAnswer QuestAnswer)
        {
            var answer = new QuestQuestionsAnswer()
            {
                QuestionID = QuestAnswer.QuestionID,
                UserID = mUserSession.ID,
                Liked = QuestAnswer.Liked,
                Dislike = QuestAnswer.Dislike,
                YesState = QuestAnswer.YesNoState,
                NoState = !QuestAnswer.YesNoState,
                CreatedDate = mDateTime.Now,
            };

            mDb.Set<QuestQuestionsAnswer>().Add(answer);

            await mDb.SaveChangesAsync();

            return true;

        }

        public async Task<bool> Exists(int UserID , int QuestionID)
        {
            var answer = await mDb.Set<QuestQuestionsAnswer>()
                .AsNoTracking()
                .Where(s => s.QuestionID == QuestionID && s.UserID == UserID)
                .AnyAsync();

            return answer;
        }
    }
}
