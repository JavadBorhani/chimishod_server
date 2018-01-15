using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Config;
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

        public GameConfig GetGameConfiguration()
        {
            var data = mDb.Set<GameConfig>()
                       .AsNoTracking()
                       .Where(qs => qs.ID == Constants.DefaultValues.QuestionSelectorConfigID)
                       .SingleOrDefault();
            return data;
        }

        public async Task<bool> SetGameConfiguration(SGameConfig Config)
        {
            var gameConfig = await mDb.Set<GameConfig>().SingleOrDefaultAsync();

            gameConfig.PeopleQuestionsPercent = Config.PeopleQuestionsPercent;
            gameConfig.TotalNumberOfQuestions = Config.TotalNumberOfQuestions;
            gameConfig.FunQuestionsPercent = Config.FunQuestionsPercent;

            await mDb.SaveChangesAsync();

            return true;;
        }
    }
}
