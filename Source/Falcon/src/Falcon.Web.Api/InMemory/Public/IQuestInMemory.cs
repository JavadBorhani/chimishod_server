using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Concurrent;

namespace Falcon.Web.Api.InMemory.Public
{
    public interface IQuestInMemory : IInMemory<ConcurrentDictionary<int , SQuest>>
    {
        SQuest GetQuestByQuestNumber(int QuestNumber);
        int GetLastLevel();
        int GetLastQuest();
        SQuest GetFinaleQuest();

        SFinaleQuest GetBarrettType(int BarrettType);
    }
}