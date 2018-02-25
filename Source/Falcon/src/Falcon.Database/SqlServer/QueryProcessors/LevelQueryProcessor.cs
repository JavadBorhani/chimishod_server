using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Quest;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class LevelQueryProcessor : ILevelQueryProcessor
    {
        private readonly IDbContext mDb;
        public LevelQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }

        public async Task<SLevel[]> GetAll()
        {
            var levels = await mDb.Set<Level>()
                .AsNoTracking()
                .Include(m => m.Quest)
                .Select(s => new SLevel
                {
                    QuestID = s.QuestID,
                    CoinPrize = s.CoinPrize,
                    LevelNumber = s.LevelNumber,
                    QuestColoredIcon = s.Quest.QuestColoredIcon,
                    QuestWhiteIcon = s.Quest.QuestWhiteIcon,
                    QuestOffIcon = s.Quest.QuestOffIcon , 
                    QuestTitle = s.Quest.QuestTitle,
                    QuestHighScore = s.Quest.QuestHighScore,
                    QuestType = (QuestTypes)s.Quest.QuestTypes,
                    ScoreCeil = s.ScoreCeil,
                })
                .ToArrayAsync();

            return levels;

        }

        public async Task<int> GetLevelQuest(int LevelNumber)
        {
            var questNumber = await mDb.Set<Level>()
                .AsNoTracking()
                .Where(l => l.LevelNumber == LevelNumber)
                .Include(l => l.Quest)
                .Select(l => l.Quest.QuestNumber)
                .SingleOrDefaultAsync();


            return questNumber;
        }
    }
}
