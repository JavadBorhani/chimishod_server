using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class UsersMaintenanceProcessor : IUsersMaintenanceProcessor
    {
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IScoringQueryProcessor mScoringQuery;

        public UsersMaintenanceProcessor(IUserQueryProcessor UserQueryProcessor , IScoringQueryProcessor ScoringQueryProcessor)
        {
            mUserQuery = UserQueryProcessor;
            mScoringQuery = ScoringQueryProcessor;
        }

        public async Task<int> LevelUp(int Prize)
        {
            var newLevel = await mUserQuery.UpdateLevel(Prize);
            var totalCoin = Constants.DefaultValues.NoNewCoin;

            if(newLevel != Constants.DefaultValues.NoLevelUp)
            {
                var levelPrize = await mUserQuery.GetLevelPrize(newLevel);
                if(levelPrize >= 0 )
                {
                    totalCoin = await mUserQuery.IncreaseCoin(levelPrize);
                }
            }

            return totalCoin;
        }
       
    }
}