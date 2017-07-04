using Falcon.Data.QueryProcessors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.EFCommonContext.DbModel;
using Falcon.EFCommonContext;
using System.Data.Entity;
using Falcon.Common;
using Falcon.Web.Models.Api;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AchievementQueryProcessor : IAchievementQueryProcessor
    {
        private readonly IDbContext mDb;
        public AchievementQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }
        public async Task<List<Achievement>> GetAchievementList(int UserID)
        {
            var achievedList = await mDb.Set<AchievedPosession>()
                                                        .AsNoTracking()
                                                        .Include(ap => ap.Achievement)
                                                        .Where(ap => ap.UserID == UserID &&
                                                               ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievedID)
                                                        .Select(ap => ap.Achievement)
                                                        .ToListAsync();
            return achievedList;
        }

        public async Task<bool> IsExists(int ID)
        {
            return await mDb.Set<Achievement>().AsNoTracking().CountAsync(a => a.ID == ID) > 0 ;
        }
    }
}
