using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class ScoringQueryProcessor : IScoringQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public ScoringQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDb = Database;
            mDateTime = DateTime;
        }
        public async Task<int> AddScore(int UserID, int Amount , AchievedScoreType AchievedScoreType)
        {
            mDb.Set<AchievedScore>().Add(new AchievedScore
            {
                UserID = UserID,
                Score = Amount,
                AchievedDate = mDateTime.Now,
                TypeID = (int)AchievedScoreType
            });

            var result = await mDb.SaveChangesAsync();
            return result;
        }

    }
}
