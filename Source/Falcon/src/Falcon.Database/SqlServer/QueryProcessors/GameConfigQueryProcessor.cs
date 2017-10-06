using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class GameConfigQueryProcessor : IGameConfigQueryProcessor
    {
        private readonly IDbContext mDb;

        public GameConfigQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }

        public async Task<QuestionSelectorConfig> GetQuestionConfiguration()
        {
            var data = await mDb.Set<QuestionSelectorConfig>()
                                .AsNoTracking()
                                .Where(qs => qs.ID == Constants.DefaultValues.QuestionSelectorConfigID)
                                .SingleOrDefaultAsync();
            return data;    
        }
    }
}
