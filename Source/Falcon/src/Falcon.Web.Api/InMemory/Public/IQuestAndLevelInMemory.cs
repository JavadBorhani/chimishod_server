using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api.Quest;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;

namespace Falcon.Web.Api.InMemory.Public
{
    public interface IQuestAndLevelInMemory : IInMemory<ConcurrentDictionary<int , SQuest>>
    {
        SQuest GetQuestByQuestNumber(int QuestNumber);
        int GetLastLevel();
        int GetLastQuest();
        SQuest GetFinaleQuest();
        SFinaleQuest GetBarrettType(int BarrettType);
        HashSet<int> GetParentQuestNumbers(List<int> QuestNumbers);
        //Barretts
        ConcurrentDictionary<int, Tuple<SFinaleQuest, List<int>>> Barretts { get; }
        List<int> GetAllBarretTypes();
        List<SQuest> GetAllQuestItems();
        int GetLevelWatchVideoMultiplier(int LevelNumber);
        int GetLevelPrize(int LevelNumber);
    }
}