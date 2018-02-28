using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api.Quest;
using System.Collections.Concurrent;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IQuestInMemoryProcessor : IInMemory<ConcurrentDictionary<int , SQuest>>
    {
        SQuest GetQuestByID(int ID);
        SQuest GetQuestByLevelNumber(int LevelNumber);
    }
}