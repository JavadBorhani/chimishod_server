using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;
using Falcon.Common;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{

    public class DWMMaintenanceProcessor : IDWMMaintenanceProcessor
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

        public async Task<SEarnRewardValidation> CollectDayReward(int DayRewardID)
        {
            var reward = await mDWMQueryProcessor.GetRewardById(DayRewardID);

            var response = new SEarnRewardValidation();
            response.RequestID = DayRewardID;

            if (reward != null)
            {
                var dwmCount = await mUserQueryProcessor.GetDWMCount();
                var isCollected = await mDWMQueryProcessor.RewardIsCollected(DayRewardID, new SDuration(mDateTime.Now.AddDays(dwmCount * -1) , mDateTime.Now));
                if(isCollected)
                {
                    response.IsValid = false;        
                    response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                    return response;
                }
                else
                {
                    if (reward.Day <= dwmCount)
                    {
                        await mDWMQueryProcessor.AddReward(new SDailyRewardAchieved
                        {
                            RewardID = DayRewardID,
                            EarnedDate = mDateTime.Now,
                        });

                        var totalCoin = await mUserQueryProcessor.AddCoin(reward.Prize);

                        response.IsValid = true;
                        response.TotalCoin = totalCoin;
                        return response;
                    }
                }
            }

            response.IsValid = false;
            response.TotalCoin = await mUserQueryProcessor.GetTotalCoin();
            return response;
        }
    }
}