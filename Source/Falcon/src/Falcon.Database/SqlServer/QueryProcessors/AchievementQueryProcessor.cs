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
using Falcon.Common.Security;
using Falcon.Web.Models.Api.Achievement;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AchievementQueryProcessor : IAchievementQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        public AchievementQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }

        public async Task<Achievement[]> GetAllAchievementList()
        {
            var data = await mDb.Set<Achievement>()
                .AsNoTracking()
                .OrderBy(s => s.QueryTypeID)
                .ThenBy(s => s.CategoryID)
                .ToArrayAsync(); 

            return data;        
        }

        public async Task<SAchievementPossesion[]> GetUserAchievedPossetionIds()
        {
            var achievedList = await mDb.Set<AchievedPosession>()
                                                        .AsNoTracking()
                                                        .Include(ap => ap.Achievement)
                                                        .Where(ap => ap.UserID == mUserSession.ID &&
                                                               ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievedID && 
                                                               ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievableID)
                                                        .Select(ap => new SAchievementPossesion
                                                        {
                                                            AchievementID = ap.AchievementID,
                                                            AchievementState = (AchievementState)ap.AchieveStateID
                                                        })
                                                        .ToArrayAsync();
            return achievedList;
        }

        public async Task<List<Achievement>> GetUserAchievements(int UserID)
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

        public async Task<AchievementStatistic> GetUserAchievementStats(int UserID)
        {
            var data = await mDb.Set<AchievementStatistic>()
                                                .AsNoTracking()
                                                .Where(s => s.UserID == UserID)
                                                .SingleOrDefaultAsync();

            return data;
        }

        public async Task<bool> IsExists(int ID)
        {
            return await mDb.Set<Achievement>().AsNoTracking().CountAsync(a => a.ID == ID) > 0 ;
        }
    }
}
