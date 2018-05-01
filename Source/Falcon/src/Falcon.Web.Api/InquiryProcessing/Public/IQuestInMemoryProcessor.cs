using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Concurrent;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IQuestInMemoryProcessor : IInMemory<ConcurrentDictionary<int , SQuest>>
    {
        SQuest GetQuestByQuestNumber(int QuestNumber);
        int GetLastLevel();
        int GetLastQuest();
        SQuest GetFinaleQuest();
    }
}