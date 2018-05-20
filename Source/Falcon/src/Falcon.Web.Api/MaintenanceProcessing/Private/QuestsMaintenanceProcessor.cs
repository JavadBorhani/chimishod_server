using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Common.Memmory;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
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
        private readonly IQuestAndLevelInMemory mQuestInMemory;
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IMemoryStore mMemory;
        private readonly IQuestSnapshotQueryProcessor mQuestSnapshot;
        private readonly IQuestQuestionsQueryProcessor mQuestQuestion;
        private readonly SClientAppState mAppSate;

        public QuestsMaintenanceProcessor(IQuestsQueryProcessor QuestsQueryProcessor , 
            IUserQuestAnswerQueryProcessor UserQuestAnswer , 
            IUserSession UserSession , 
            IQuestAndLevelInMemory QuestInMemory , 
            IUserQueryProcessor UserQuery , 
            IQuestSnapshotQueryProcessor QuestSnapshot,
            IMemoryStore Memory , 
            IQuestQuestionsQueryProcessor QuestQuestion , 
            IClientApplicationState AppState)
        {
            mQuestsQueryProcessor = QuestsQueryProcessor;
            mUserQuestAnswer = UserQuestAnswer;
            mUserSession = UserSession;
            mQuestInMemory = QuestInMemory;
            mUserQuery = UserQuery;
            mMemory = Memory;
            mQuestSnapshot = QuestSnapshot;
            mQuestQuestion = QuestQuestion;
            mAppSate = AppState.State();
        }

        public async Task<bool> AddScore(int QuestionID , int CurrentUserQuestNumber, bool IsYes)
        {
            var questQuestion = await mQuestsQueryProcessor.GetQuestQuestionLimitedByCurrentUserQuest(QuestionID , CurrentUserQuestNumber);
            

            if(questQuestion != null && (SQuestQuestionType)questQuestion.QuestionType == SQuestQuestionType.Score)
            {
                var yesQuestNumber = questQuestion.YesQuestNumber ?? 0 ;
                var yesPoint = questQuestion.YesScore;

                var noQuestNumber = questQuestion.NoQuestNumber ?? 0;
                var noPoint = questQuestion.NoScore;

                var questDetail = mQuestInMemory.GetQuestByQuestNumber(questQuestion.QuestNumber);
                var questFather = questDetail.ParentID ?? 0;

                if (questFather == 0)
                    throw new BusinessRuleViolationException("parent id should not be incremented , check design database");

                if(noQuestNumber == 0 || yesQuestNumber == 0)
                    throw new BusinessRuleViolationException("quest number can not be null , game design issue");

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

        public async Task<bool> TakeSnapshot(int QuestNumber)
        {
            int questNumber = QuestNumber;

            var quest = mQuestInMemory.GetQuestByQuestNumber(questNumber);

            if ((questNumber != 0 && quest != null))
            {
                
                var questFatherNumber = quest.ParentID ?? quest.QuestNumber;

                if(questFatherNumber != 0)
                {
                    var questFather = mQuestInMemory.GetQuestByQuestNumber(questFatherNumber);

                    List<int> questIdsToTakeSnapshot = new List<int>(questFather.ChildQuestNumbers)
                    {
                        questFather.QuestNumber
                    };

                    var questsToTakeSnapshot = await mQuestsQueryProcessor.GetUserQuestScoresByIds(questIdsToTakeSnapshot);

                    var snapshot = await mQuestSnapshot.SaveUserCheckPoint(questsToTakeSnapshot, questNumber);

                    return true;
                    //take snapshot 
                }
            }
            return false;
            
        }

        public async Task<bool> SaveQuestQuestionAnswer(SQuestAnswer Answer)
        {
            Answer.UserID = mUserSession.ID;
               
            var answered = await mQuestQuestion.Exists(Answer.UserID, Answer.QuestionID);

            if (answered)
                return true;

            var userQuestNumber = await mUserQuery.GetUserCurrentQuestNumber();

            if (userQuestNumber != Answer.QuestNumber)
                return false;

            var question = await mQuestsQueryProcessor.GetQuestQuestion(Answer.QuestNumber, Answer.QuestionID);


            if (question != null && (HashTagID) question.HashTagID == HashTagID.Quest)
            {
                var stored = await mQuestQuestion.SaveQuestQuestionAnswer(Answer);

                if(stored)
                {
                    var status = await mUserQuery.UpdateQuest(mAppSate.XPQuestFactor, mQuestInMemory.GetLastQuest());

                    await AddScore(question.ID, userQuestNumber , Answer.YesNoState);

                    if (status.QuestUpMode == QuestUpMode.QuestUpped)
                    {
                        await TakeSnapshot(status.QuestUpNumber);
                    }
                }

                return true;
            }

            return false;
        }

        public async Task<int> PurchaseQuest(int QuestNumber)
        {
            var quest = mQuestInMemory.GetQuestByQuestNumber(QuestNumber);
            if(quest != null)
            {
                var purchased = await mQuestsQueryProcessor.IsPurchased(QuestNumber);

                if (!purchased)
                {
                    var canPurchaseQuest = await mUserQuery.CanPurchaseQuest(QuestNumber , mQuestInMemory.GetLastQuest());

                    if (canPurchaseQuest)
                    {
                        var totalCoin = await mUserQuery.DecreaseCoin(quest.Price);

                        if (totalCoin < 0)
                            throw new BusinessRuleViolationException($"there is not enough moeny : userID {mUserSession.ID},");

                        await mQuestsQueryProcessor.Purchase(QuestNumber);
                        await mUserQuery.SetQuest(QuestNumber , true);

                        return totalCoin;
                    }
                    else
                    {
                        return -1;   
                    }    
                }
                var coinAmount = await mUserQuery.GetTotalCoin();
                return coinAmount;
            }
            return -1;
        }
    }
}