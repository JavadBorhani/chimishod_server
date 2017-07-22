using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Achievement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAchievementQueryProcessor
    {
        Task<bool> IsExists(int ID);
        Task<List<Achievement>> GetUserAchievements(int UserID);
        Task<Achievement[]> GetAllAchievementList();
        Task<SAchievementPossesion[]> GetUserAchievedPossetionIds();
        Task<SAchievementStatistic> GetUserAchievementStats(int UserID); // bring user statistic information based on his actions
        Task<UserAchievementRecord[]> GetAllAchievementWithUserState(int UserID);
        Task<bool> AddingAchievementPossetionItems(int UserID, List<int> Items, AchievementState AchievementState);
    }
}
