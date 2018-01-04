using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestsQueryProcessor : IQuestsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        public QuestsQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDb = Database;
            mDateTime = DateTime;
        }
        public async Task<Quest[]> GetAllQuests()
        {
            var data = await mDb.Set<Quest>().AsNoTracking().ToArrayAsync();
            return data;
        }

        public async Task<Quest> GetQuestByID(int ID)
        {
            var data = await mDb.Set<Quest>().AsNoTracking().SingleOrDefaultAsync(q => q.QuestNumber == ID);
            return data;
        }
    }
}
