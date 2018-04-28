﻿using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Common.Memmory;
using Falcon.Web.Models.Api.Quest;
using System;
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
        private readonly IQuestSnapshotQueryProcessor mQuestSnapshot;

        public QuestsMaintenanceProcessor(IQuestsQueryProcessor QuestsQueryProcessor , 
            IUserQuestAnswerQueryProcessor UserQuestAnswer , 
            IUserSession UserSession , 
            IQuestInMemoryProcessor QuestInMemory , 
            IUserQueryProcessor UserQuery , 
            IQuestSnapshotQueryProcessor QuestSnapshot,
            IMemoryStore Memory)
        {
            mQuestsQueryProcessor = QuestsQueryProcessor;
            mUserQuestAnswer = UserQuestAnswer;
            mUserSession = UserSession;
            mQuestInMemory = QuestInMemory;
            mUserQuery = UserQuery;
            mMemory = Memory;
            mQuestSnapshot = QuestSnapshot;
        }
        public async Task<bool> AddScore(int QuestionID , bool IsYes)
        {
            var questQuestion = await mQuestsQueryProcessor.GetQuestQuestionLimitedByCurrentUserQuest(QuestionID);
            

            if(questQuestion != null)
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

        public async Task<bool> TakeSnapshot()
        {
            int questNumber  = mMemory.LoadState<int>(GlobalVariables.QuestToTakeSnapshot);
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

        public async Task<bool> SaveQuestAnswer()
        {
            throw new NotImplementedException();
        }

        public async Task<bool> PurchaseQuest(int QuestNumber)
        {
            throw new NotImplementedException();
        }
    }
}