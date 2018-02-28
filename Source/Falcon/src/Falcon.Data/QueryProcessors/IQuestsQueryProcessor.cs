using Falcon.EFCommonContext.DbModel;
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
        Task<SQuestDetail[]> GetQuestDetail(int QuestNumber);
        Task<SFriendQuestDetail[]> GetFriendQuestDetail(int FriendID, int QuestNumber);
        Task<QuestScore[]> GetUserQuestScoresByIds(List<int> Ids);
    }
}
