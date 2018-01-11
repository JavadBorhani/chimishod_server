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
         
        public WatchAdMaintenanceProcessor
            (
            IWatchAdQueryProcessor WatchAdQueryProcessor , 
            IUserQueryProcessor UserQueryProcessor , 
            IWatchAdValidator WatchAdValidator,
            IWebUserSession UserSession , 
            IDateTime DateTime ,
            IClientApplicationState AppState
            )
        {
            mWatchAdQueryProcessor = WatchAdQueryProcessor;
            mUserQueryProcessor = UserQueryProcessor;
            mWatchAdValidator = WatchAdValidator;
            mUserSession = UserSession;
            mDateTime = DateTime;
            mAppState = AppState;   
        }
        public async Task<int> ValidateWatchAd(SWatchAdValidation WatchAdValidation)
        {
            var exists = await mWatchAdQueryProcessor.IsExists(WatchAdValidation.WatchAdId);
            if(!exists)
            {
                if(WatchAdValidation.ProviderID == WatchAdProvider.TapSell) //TODO: If new provider added , change the logic 
                {
                    var result = await mWatchAdValidator.ValidateWatchAd(Constants.WatchAdVerfierAddress.TapSellLink, 
                        new WatchAd.Private.RequestToken
                    {
                        suggestionId = WatchAdValidation.WatchAdId,
                    });

                    if(!result.valid)
                    {
                        await mWatchAdQueryProcessor.AddWatchedInfo(new SWatchedAd
                        {
                            UserID = mUserSession.ID,
                            WatchAdId = WatchAdValidation.WatchAdId,
                            WatchAdProviderId = (int)WatchAdProvider.TapSell,
                            InsertDate = mDateTime.Now
                        });

                        var totalCoin = await mUserQueryProcessor.IncreaseCoin(mAppState.State().WatchAdCoin);

                        return totalCoin;
                    }
                }
            }

            var currentTotalCoin = await mUserQueryProcessor.GetTotalCoin();
            return currentTotalCoin;
        }
    }
}