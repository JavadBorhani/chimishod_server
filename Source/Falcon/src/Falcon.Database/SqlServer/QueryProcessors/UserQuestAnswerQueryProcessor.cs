using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserQuestAnswerQueryProcessor : IUserQuestAnswerQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;

        public UserQuestAnswerQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
        }
        public async Task<bool> AddUserAnswer(SUserQuestAnswer Answer)
        {
            if (Answer == null)
                return false;

            
            var userAnswers = new UserQuestAnswer
            {
                UserID = mUserSession.ID,
                QuestNumber = Answer.QuestNumber,
                Point = Answer.Point,
            };

            mDb.Set<UserQuestAnswer>().Add(userAnswers);

            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<bool> AddUserAnswer(SUserQuestAnswer[] Answer)
        {
            if(Answer == null)
                return false;

            var userAnswers = new UserQuestAnswer[Answer.Length];
            for(int i = 0; i < userAnswers.Length; ++i)
            {
                userAnswers[i] = new UserQuestAnswer
                {
                    UserID = mUserSession.ID,
                    QuestNumber = Answer[i].QuestNumber,
                    Point = Answer[i].Point,
                };
            }

            mDb.Set<UserQuestAnswer>().AddRange(userAnswers);

            await mDb.SaveChangesAsync();
            return true;
        }
    }
}
