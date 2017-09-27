using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Level;
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
            var totalCoin = Constants.DefaultValues.NoNewCoin;

            SLevelUpInfo info;
            do
            {
                info = await mUserQuery.UpdateLevel(Prize);

                if (info.LevelUpMode != LevelUpMode.NotLeveledUp)
                {
                    var levelPrize = await mUserQuery.GetLevelPrize(info.LevelUpNumber);

                    if (levelPrize >= 0)
                    {
                        totalCoin = await mUserQuery.IncreaseCoin(levelPrize);
                    }
                }

                Prize = 0; 

            } while (info.LevelUpMode == LevelUpMode.LeveledUpAndNeedAnother);

            return totalCoin;
        }
    }
}