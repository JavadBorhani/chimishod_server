using Falcon.Common;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{

    public class DWMMaintenanceProcessor /*: IDWMMaintenanceProcessor*/
    {
        private readonly IDWMQueryProcessor mDWMQueryProcessor;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IDateTime mDateTime;
        public DWMMaintenanceProcessor(IDWMQueryProcessor DWMQueryProcessor , IUserQueryProcessor UserQueryProcessor , IDateTime DateTime)
        {
            mDWMQueryProcessor = DWMQueryProcessor; 
            mUserQueryProcessor = UserQueryProcessor;
            mDateTime = DateTime;
        }

        //public async Task<SEarnRewardValidation> CollectDayReward(int DayRewardID)
        //{
        //    var reward = await mDWMQueryProcessor.GetRewardById(DayRewardID);

        //    var response = new SEarnRewardValidation();
        //    response.RequestID = DayRewardID;

        //    if (reward != null)
        //    {
        //        var dwmCount = await mUserQueryProcessor.GetDWMCount();
        //        var isCollected = await mDWMQueryProcessor.RewardIsCollected(DayRewardID, new SDuration(mDateTime.Now.AddDays(dwmCount * -1) , mDateTime.Now));
        //        if(isCollected)
        //        {
        //            response.DailyRewardState = DailyRewardState.Collected;
        //            response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();
        //            return response;
        //        }
        //        else
        //        {
        //            if (reward.Day <= dwmCount)
        //            {
        //                await mDWMQueryProcessor.AddReward(new SDailyRewardAchieved
        //                {
        //                    RewardID = DayRewardID,
        //                    EarnedDate = mDateTime.Now,
        //                });

        //                var totalCoin = await mUserQueryProcessor.IncreaseCoin(reward.Prize);

        //                response.DailyRewardState= DailyRewardState.Collected;
        //                response.TotalCoin = totalCoin;
        //                return response;
        //            }
        //            else
        //            {
        //                response.DailyRewardState = DailyRewardState.NotCollectible;
        //            }
        //        }
        //    }
        //    response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();
        //    return response;
        //}
    }
}