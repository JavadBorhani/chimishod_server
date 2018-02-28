using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Common.Memmory;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class QuestsMaintenanceProcessor : IQuestsMaintenanceProcessor
    {
        private readonly IQuestsQueryProcessor mQuestsQueryProcessor;
        private readonly IUserQuestAnswerQueryProcessor mUserQuestAnswer;
        private readonly IUserSession mUserSession;
        private readonly IQuestInMemoryProcessor mQuestInMemory;
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IMemoryStore mMemory;

        public QuestsMaintenanceProcessor(IQuestsQueryProcessor QuestsQueryProcessor , 
            IUserQuestAnswerQueryProcessor UserQuestAnswer , 
            IUserSession UserSession , 
            IQuestInMemoryProcessor QuestInMemory , 
            IUserQueryProcessor UserQuery , 
            IMemoryStore Memory)
        {
            mQuestsQueryProcessor = QuestsQueryProcessor;
            mUserQuestAnswer = UserQuestAnswer;
            mUserSession = UserSession;
            mQuestInMemory = QuestInMemory;
            mUserQuery = UserQuery;
            mMemory = Memory;
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

                var questDetail = mQuestInMemory.GetQuestByID(questQuestion.QuestNumber);
                var questFather = questDetail.ParentID ?? 0;

                if (questFather == 0)
                    throw new BusinessRuleViolationException("parent id should not be incremented , check design database");

                if (IsYes)
                {
                    await mUserQuestAnswer.AddUserAnswer(new SUserQuestAnswer[]
                    {
                        new SUserQuestAnswer
                        {
                            UserID = mUserSession.ID,
                            QuestNumber = yesQuestNumber,
                            Point = yesPoint,
                        },
                        new SUserQuestAnswer
                        {
                            UserID = mUserSession.ID,
                            QuestNumber = questFather ,
                            Point = yesPoint
                        },
                    });
                }
                else
                {
                    await mUserQuestAnswer.AddUserAnswer(new SUserQuestAnswer[]
                   {
                        new SUserQuestAnswer
                        {
                            UserID = mUserSession.ID,
                            QuestNumber = noQuestNumber,
                            Point = noPoint,
                        },
                        new SUserQuestAnswer
                        {
                            UserID = mUserSession.ID,
                            QuestNumber = questFather,
                            Point = noPoint,
                        },
                   });
                }
                return true;
            }

            return false;   
        }

        public async Task<bool> TakeSnapshot()
        {
            int levelNumber  = mMemory.LoadState<int>(GlobalVariables.LevelToTakeSnapshot);

            if(levelNumber != 0)
            {
                var quest = mQuestInMemory.GetQuestByLevelNumber(levelNumber);
                var questFatherNumber = quest.ParentID ?? 0;

                if(questFatherNumber != 0)
                {
                    var questFather = mQuestInMemory.GetQuestByID(questFatherNumber);

                    List<int> questIdsToTakeSnapshot = new List<int>(questFather.ChildQuestNumbers)
                    {
                        questFather.QuestNumber
                    };

                    var questsToTakeSnapshot = await mQuestsQueryProcessor.GetUserQuestScoresByIds(questIdsToTakeSnapshot);
                    
                    


                    //take snapshot 

                }
            }

            return true;
            
        }
    }
}