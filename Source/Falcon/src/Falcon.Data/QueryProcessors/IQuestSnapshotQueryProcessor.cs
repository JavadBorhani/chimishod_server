using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestSnapshotQueryProcessor
    {
        Task<bool> SaveUserCheckPoint(QuestScore[] QuestScores , int LevelNumber);
    }
}
