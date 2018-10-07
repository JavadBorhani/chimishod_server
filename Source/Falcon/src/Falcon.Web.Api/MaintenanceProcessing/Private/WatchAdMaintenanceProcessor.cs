// Flapp Copyright 2017-2018
using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.WatchAd.Public;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class WatchAdMaintenanceProcessor : IWatchAdMaintenanceProcessor
    {
        private readonly IWatchAdQueryProcessor mWatchAdQueryProcessor;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IWatchAdValidator mWatchAdValidator;
        private readonly IWebUserSession mUserSession;
        private readonly IDateTime mDateTime;
        private readonly IClientApplicationState mAppState;
        private readonly IWatchAdManager mWatchAdManager;
         
        public WatchAdMaintenanceProcessor
            (
            IWatchAdQueryProcessor WatchAdQueryProcessor , 
            IUserQueryProcessor UserQueryProcessor , 
            IWatchAdValidator WatchAdValidator,
            IWebUserSession UserSession , 
            IDateTime DateTime ,
            IClientApplicationState AppState , 
            IWatchAdManager WatchAdManager
            )
        {
            mWatchAdQueryProcessor = WatchAdQueryProcessor;
            mUserQueryProcessor = UserQueryProcessor;
            mWatchAdValidator = WatchAdValidator;
            mUserSession = UserSession;
            mDateTime = DateTime;
            mAppState = AppState;
            mWatchAdManager = WatchAdManager;
        }
        public async Task<int> ValidateWatchAd(SWatchAdValidation WatchAdValidation)
        {
            var exists = await mWatchAdQueryProcessor.IsExists(WatchAdValidation.WatchAdId);
            if(!exists)
            {
                var verified = await mWatchAdManager.ValidateWatchAd(WatchAdValidation);
                
                if(verified)
                {
                    var totalCoin = await mUserQueryProcessor.IncreaseCoin(mAppState.State().WatchAdCoin);
                    return totalCoin;
                }
            }

            var currentTotalCoin = await mUserQueryProcessor.GetTotalCoin();
            return currentTotalCoin;
        }

        public async Task<bool> ValidateLevelUpWatchAd(SWatchAdValidation WatchAdValidation)
        {
            var exists = await mWatchAdQueryProcessor.IsExists(WatchAdValidation.WatchAdId , WatchAdValidation.LevelNumber);

            if (!exists)
            {
                var verified = await mWatchAdManager.ValidateLevelUp(WatchAdValidation);
                return verified;
            }

            return false;
        }
    }
}