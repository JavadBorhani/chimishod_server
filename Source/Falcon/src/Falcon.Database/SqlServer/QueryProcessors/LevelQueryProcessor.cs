using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Level;
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
                .Select(s => new SLevel
                {
                    CoinPrize = s.CoinPrize,
                    LevelNumber = s.LevelNumber,
                    ScoreCeil = s.ScoreCeil,
                })
                .ToArrayAsync();

            return levels;

        }
    }
}
