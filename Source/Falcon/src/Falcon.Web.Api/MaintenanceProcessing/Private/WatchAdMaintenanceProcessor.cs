// Flapp Copyright 2017-2018
using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.WatchAd.Private;
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
                    ResponseToken result = null;
                    try
                    {
                        result = await mWatchAdValidator.ValidateWatchAd(Constants.WatchAdVerfierAddress.TapSellLink,
                        new RequestToken
                        {
                            suggestionId = WatchAdValidation.WatchAdId,
                        });

                    }
                    catch
                    {
                        result = new ResponseToken
                        {
                            valid = false
                        };
                    }
                   
                    if(result != null)
                    {
                        await mWatchAdQueryProcessor.AddWatchedInfo(new SWatchedAd
                        {
                            UserID = mUserSession.ID,
                            WatchAdId = WatchAdValidation.WatchAdId,
                            WatchAdProviderId = (int)WatchAdProvider.TapSell,
                            IsLevel = false,
                            LevelNumber = 0,
                            Consumed = result.valid,
                            InsertDate = mDateTime.Now,
                            UpdatedDate = mDateTime.Now
                        });

                        var totalCoin = await mUserQueryProcessor.IncreaseCoin(mAppState.State().WatchAdCoin);

                        return totalCoin;
                    }
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
                if (WatchAdValidation.ProviderID == WatchAdProvider.TapSell) //TODO: If new provider added , change the logic 
                {
                    ResponseToken token;
                    try
                    {
                       token = await mWatchAdValidator.ValidateWatchAd(Constants.WatchAdVerfierAddress.TapSellLink,
                       new RequestToken
                       {
                           suggestionId = WatchAdValidation.WatchAdId,
                       });
                    }
                    catch
                    {
                        token = new ResponseToken
                        {
                            valid = false
                        };

                        //remember to add job system in order to validate 
                    }

                    await mWatchAdQueryProcessor.AddWatchedInfo(new SWatchedAd
                    {
                        UserID = mUserSession.ID,
                        WatchAdId = WatchAdValidation.WatchAdId,
                        WatchAdProviderId = (int)WatchAdProvider.TapSell,
                        IsLevel = WatchAdValidation.IsLevel ,
                        LevelNumber = WatchAdValidation.LevelNumber,
                        Consumed = token.valid,
                        InsertDate = mDateTime.Now,
                        UpdatedDate = mDateTime.Now,
                    });

                    return true;
                }
            }

            return false;
        }
    }
}