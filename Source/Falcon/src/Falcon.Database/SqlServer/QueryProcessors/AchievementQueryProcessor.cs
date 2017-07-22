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

        public AchievementQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }

        public async Task<Achievement[]> GetAllAchievementList()
        {
            var data = await mDb.Set<Achievement>()
                .AsNoTracking()
                .OrderBy(s => s.Priority)
                .ToArrayAsync(); 

            return data;        
        }

        public async Task<UserAchievementTable[]> GetAllAchievementWithUserState(int UserID)
        {
            var userAchievedPossesion = mDb.Set<AchievedPosession>().AsNoTracking()
                                                                .Where(ap => ap.UserID == mUserSession.ID &&
                                                               ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievedID &&
                                                               ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievableID);

            var data = await mDb.Set<Achievement>()
                            .AsNoTracking()
                            .GroupJoin(userAchievedPossesion, achievement => achievement.ID, achievePos => achievePos.AchievementID, (achievement, achievePos) => new
                            {
                                achievement = achievement,
                                achievePos = achievePos
                            })
                            .SelectMany(temp => temp.achievePos.DefaultIfEmpty(), (joinData, achievePos) => new UserAchievementTable
                            {
                                ID = joinData.achievement.ID,
                                Coin = joinData.achievement.Coin,
                                AchievementState = (achievePos != null) ? (AchievementState) achievePos.AchieveStateID : AchievementState.NotSpecified,
                                CategoryID = joinData.achievement.CategoryID,
                                Icon = joinData.achievement.Icon,
                                IsActive = joinData.achievement.IsActive,
                                Priority = joinData.achievement.Priority,
                                Description = joinData.achievement.Description,
                                Name = joinData.achievement.Name,
                                Quantity = joinData.achievement.Quantity,
                                QueryTypeID = joinData.achievement.QueryTypeID,
                                ScorePrize = joinData.achievement.ScorePrize,
                            })
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
