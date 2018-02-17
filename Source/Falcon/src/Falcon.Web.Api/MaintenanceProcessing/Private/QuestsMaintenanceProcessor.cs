using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class QuestsMaintenanceProcessor : IQuestsMaintenanceProcessor
    {
        private readonly IQuestsQueryProcessor mQuestsQueryProcessor;
        private readonly IUserQuestAnswerQueryProcessor mUserQuestAnswer;
        private readonly IUserSession mUserSession;
        public QuestsMaintenanceProcessor(IQuestsQueryProcessor QuestsQueryProcessor , IUserQuestAnswerQueryProcessor UserQuestAnswer , IUserSession UserSession)
        {
            mQuestsQueryProcessor = QuestsQueryProcessor;
            mUserQuestAnswer = UserQuestAnswer;
            mUserSession = UserSession;
        }
        public async Task<bool> AddScore(int QuestionID , bool IsYes)
        {
            var questQuestion = await mQuestsQueryProcessor.GetQuestQuestionLimitedByCurrentUserQuest(QuestionID);

            if(questQuestion != null)
            {
                var yesQuestNumber = questQuestion.YesQuestNumber;
                var yesPoint = questQuestion.YesScore;

                var noQuestNumber = questQuestion.NoQuestNumber;
                var noPoint = questQuestion.NoScore;


                if (IsYes)
                {
                    await mUserQuestAnswer.AddUserAnswer(new SUserQuestAnswer
                    {
                        UserID = mUserSession.ID,
                        Point = yesPoint,
                        QuestNumber = yesQuestNumber
                    });
                }
                else
                {
                    await mUserQuestAnswer.AddUserAnswer(new SUserQuestAnswer
                    {
                        UserID = mUserSession.ID,
                        Point = yesPoint,
                        QuestNumber = yesQuestNumber
                    });
                }
                return true;
            }

            return false;   
        }
    }
}