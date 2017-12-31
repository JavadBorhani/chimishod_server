using Falcon.Common.Security;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class DWMQueryProcessor /*: IDWMQueryProcessor*/
    {

        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        public DWMQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }

        //public async Task<bool> AddReward(SDailyRewardAchieved DailyRewardAchieved)
        //{
        //    mDb.Set<DailyRewardsAchieved>().Add(new DailyRewardsAchieved
        //    {
        //        UserID = mUserSession.ID,
        //        DailyRewardsID = DailyRewardAchieved.RewardID,
        //        EarnedDate = DailyRewardAchieved.EarnedDate
        //    });
        //    await mDb.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<DailyReward[]> GetAllRewards()
        //{
        //    var list = await mDb.Set<DailyReward>().AsNoTracking().OrderBy(s => s.Day).ToArrayAsync();
        //    return list;
        //}

        //public async Task<List<int>> GetEarnedRewardIds(SDuration Duration)
        //{
        //    var result = await mDb.Set<DailyRewardsAchieved>()
        //        .AsNoTracking()
        //        .Where(dra => (dra.EarnedDate >= Duration.From.Date && dra.EarnedDate <= Duration.To) && dra.UserID == mUserSession.ID)
        //        .Select(dra => dra.DailyRewardsID)
        //        .ToListAsync();

        //    return result;  
        //}

        //public Task<DailyReward> GetRewardById(int ID)
        //{
        //    var reward = mDb.Set<DailyReward>().AsNoTracking().Where(dr => dr.ID == ID).SingleOrDefaultAsync();
        //    return reward;
        //}

        //public async Task<bool> RewardIsCollected(int RewardID, SDuration Duration)
        //{
        //    var collected = await mDb.Set<DailyRewardsAchieved>()
        //        .AsNoTracking()
        //        .CountAsync(
        //            dra => dra.UserID == mUserSession.ID &&
        //            (dra.EarnedDate >= Duration.From && dra.EarnedDate <= Duration.To) &&
        //            dra.DailyRewardsID == RewardID) > 0;

        //    return collected;
        //}
    }
}
