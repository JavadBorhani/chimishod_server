using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestsQueryProcessor
    {
        Task<SQuest[]> GetAllQuests();
        Task<Quest> GetQuestByID(int QuestNumber);
        Task<Question[]> GetQuestQuestions(int QuestNumber);
    }
}
