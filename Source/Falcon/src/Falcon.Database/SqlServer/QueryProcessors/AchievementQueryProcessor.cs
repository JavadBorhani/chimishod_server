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
using AutoMapper;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AchievementQueryProcessor : IAchievementQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;
        private readonly IMapper mMapper;

        public AchievementQueryProcessor(IDbContext Database, IUserSession UserSession, IDateTime DateTime, IMapper Mapper)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
            mMapper = Mapper;
        }

        public async Task<bool> AddingAchievementPossetionItems(int UserID, List<int> Items, AchievementState AchievementState)
        {
            var data = new AchievedPosession[Items.Count];

            for (int i = 0; i < Items.Count; ++i)
            {
                data[i] = new AchievedPosession
                {
                    UserID = UserID,
                    AchievementID = Items[i],
                    AchieveStateID = (int)AchievementState,
                    AchievableDate = mDateTime.Now,
                };
            }

            mDb.Set<AchievedPosession>().AddRange(data);
            await mDb.SaveChangesAsync();

            return true;
        }

        public async Task<Achievement[]> GetAllAchievementList()
        {
            var data = await mDb.Set<Achievement>()
                .AsNoTracking()
                .OrderBy(s => s.Priority)
                .ToArrayAsync();

            return data;
        }

        public async Task<UserAchievementRecord[]> GetAllAchievementWithUserState(int UserID)
        {
            var userAchievedPossesion = mDb.Set<AchievedPosession>().AsNoTracking()
                                                                .Where(ap => ap.UserID == mUserSession.ID);

            var data = await mDb.Set<Achievement>()
                            .AsNoTracking()
                            .GroupJoin(userAchievedPossesion, achievement => achievement.ID, achievePos => achievePos.AchievementID, (achievement, achievePos) => new
                            {
                                achievement = achievement,
                                achievePos = achievePos
                            })
                            .SelectMany(temp => temp.achievePos.DefaultIfEmpty(), (joinData, achievePos) => new UserAchievementRecord
                            {
                                ID = joinData.achievement.ID,
                                Coin = joinData.achievement.Coin,
                                AchievementState = (achievePos != null) ? (AchievementState)achievePos.AchieveStateID : AchievementState.NotSpecified,
                                CategoryID = joinData.achievement.CategoryID,
                                Icon = joinData.achievement.Icon,
                                IsActive = joinData.achievement.IsActive,
                                Priority = joinData.achievement.Priority,
                                Description = joinData.achievement.Description,
                                Name = joinData.achievement.Name,
                                Quantity = joinData.achievement.Quantity,
                                QueryTypeID = joinData.achievement.QueryTypeID,
                                XpPrize = joinData.achievement.XP,
                            })
                            .OrderBy(AchievementRecord => AchievementRecord.Priority)
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

        public async Task<SAchievementStatistic> GetUserAchievementStats(int UserID)
        {
            var data = await mDb.Set<AchievementStatistic>()
                                                .AsNoTracking()
                                                .Where(s => s.UserID == UserID)
                                                .SingleOrDefaultAsync();

            var result = mMapper.Map<SAchievementStatistic>(data);

            return result;
        }

        public async Task<bool> IsExists(int ID)
        {
            return await mDb.Set<Achievement>().AsNoTracking().CountAsync(a => a.ID == ID) > 0;
        }

        public async Task<Achievement> AchieveItem(int AchievementID)
        {
            var achievablePossesionItem = await mDb.Set<AchievedPosession>()
                                      .Include(ap => ap.Achievement)
                                      .Where(ap => ap.UserID == mUserSession.ID &&
                                             ap.AchievementID == AchievementID &&
                                             ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievableID)
                                      .SingleOrDefaultAsync();

            if(achievablePossesionItem != null)
            {
                achievablePossesionItem.AchieveStateID = (int)AchievementState.AchievementDefaultAchievedID;
                achievablePossesionItem.AchievedDate = mDateTime.Now;
                await mDb.SaveChangesAsync();

                return achievablePossesionItem.Achievement;
            }
            return null;
        }
    }
}
