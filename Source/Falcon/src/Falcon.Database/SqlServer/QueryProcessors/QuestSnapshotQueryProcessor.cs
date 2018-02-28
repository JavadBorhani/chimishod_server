using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestSnapshotQueryProcessor : IQuestSnapshotQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public QuestSnapshotQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDb = Database;
            mDateTime = DateTime;
        }
        public async Task<bool> SaveUserCheckPoint(QuestScore[] QuestScores , int LevelNumber)
        {
            var snapshots = new QuestScoreSnapshot[QuestScores.Length];

            for(int i = 0; i < snapshots.Length;  ++ i )
            {
                snapshots[i] = new QuestScoreSnapshot
                {
                    UserID = QuestScores[i].UserID,
                    QuestNumber = QuestScores[i].QuestNumber,
                    ScorePoint = QuestScores[i].Score,
                    UserLevelNumber = LevelNumber,
                    CreatedDate = mDateTime.Now,
                    UpdatedDate = mDateTime.Now,
                };
            }

            mDb.Set<QuestScoreSnapshot>().AddRange(snapshots);
            await mDb.SaveChangesAsync();

            return true;
        }
    }
}
