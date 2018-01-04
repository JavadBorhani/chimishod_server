using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestsQueryProcessor
    {
        Task<Quest[]> GetAllQuests();
        Task<Quest> GetQuestByID(int QuestNumber); 

    }
}
