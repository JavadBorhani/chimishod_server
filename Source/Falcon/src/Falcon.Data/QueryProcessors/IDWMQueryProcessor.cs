using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IDWMQueryProcessor
    {
        Task<List<int>> GetEarnedRewardIds(SDuration Duration);
        Task<DailyReward[]> GetAllRewards();
        Task<DailyReward> GetRewardById(int ID);
        Task<bool> RewardIsCollected(int RewardID, SDuration Duration);
        Task<bool> AddReward(SDailyRewardAchieved DailyRewardAchieved);
    }
}
