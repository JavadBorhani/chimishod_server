﻿using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestsQueryProcessor
    {
        Task<SQuest[]> GetAllQuests();

        Task<Quest> GetQuestByID(int QuestNumber);

        Task<Question[]> GetQuestQuestions(int QuestNumber);

        Task<QuestQuestion> GetQuestQuestionLimitedByCurrentUserQuest(int QuestionID);

        Task<List<QuestScoreSnapshot>> GetFriendQuestDetail(int UserID, int LevelNumber, List<int> QuestNumber);

        Task<QuestScore[]> GetUserQuestScoresByIds(List<int> Ids);

        Task<List<SQuestDetail>> GetQuestDetailWithPeopleStatus(int LevelNumber, List<int> QuestNumbers);

        Task<List<SQuestDetail>> GetLiveQuestDetailWithPeopleStatus(int LevelNumber, List<int> QuestNumbers);

        Task<bool> IsPurchased(int QuestNumber);

        Task<bool> Purchase(int questNumber);

        /// <summary>
        /// Get Question if it's in QuestQuestions
        /// </summary>
        /// <param name="QuestNumber"></param>
        /// <param name="QuetionID"></param>
        /// <returns></returns>
        Task<Question> GetQuestQuestion(int QuestNumber, int QuetionID);

        Task<SFinaleQuest> GetFinaleQuestDescription(int FinaleItemID);
    }
}
