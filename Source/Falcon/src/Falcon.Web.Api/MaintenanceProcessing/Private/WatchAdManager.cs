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
    public class WatchAdManager : IWatchAdManager
    {
        private enum ValidateMode
        {
            LeveledUp , 
            WatchVideo,
        }
        private readonly IWebUserSession mUserSession;
        private readonly IDateTime mDateTime;
        private readonly IWatchAdQueryProcessor mWatchAdQueryProcessor;
        private readonly IWatchAdValidator mWatchAdValidator;

        public WatchAdManager(
            IWatchAdQueryProcessor WatchAdQueryProcessor ,
            IWatchAdValidator WatchAdValidator , 
            IDateTime DateTime , 
            IWebUserSession UserSession)
        {
            mDateTime = DateTime;
            mWatchAdQueryProcessor = WatchAdQueryProcessor;
            mWatchAdValidator = WatchAdValidator;
            mUserSession = UserSession;
        }

        public async Task<bool> ValidateLevelUp(SWatchAdValidation WatchAdValidation)
        {
            if(WatchAdValidation != null)
            {
                switch(WatchAdValidation.ProviderID)
                {
                    case WatchAdProvider.Tapligh:
                        return await ValidateThroughTapligh(WatchAdValidation, ValidateMode.LeveledUp);

                    case WatchAdProvider.TapSell:

                        return await ValidateThroughTapsell(WatchAdValidation, ValidateMode.LeveledUp);

                    case WatchAdProvider.UnityAds:

                        return await ValidateThroughUnityAds(WatchAdValidation, ValidateMode.LeveledUp);
                }
            }
            return false;
        }

        public async Task<bool> ValidateWatchAd(SWatchAdValidation WatchAdValidation)
        {
            if(WatchAdValidation != null)
            {
                switch(WatchAdValidation.ProviderID)
                {
                    case WatchAdProvider.Tapligh:
                        return await ValidateThroughTapligh(WatchAdValidation , ValidateMode.WatchVideo);
                        

                    case WatchAdProvider.TapSell:
                        return await ValidateThroughTapsell(WatchAdValidation , ValidateMode.WatchVideo);


                    case WatchAdProvider.UnityAds:
                        return await ValidateThroughUnityAds(WatchAdValidation , ValidateMode.WatchVideo);
                }
            }

            return false;   
        }

        private async Task<bool> ValidateThroughTapligh(SWatchAdValidation WatchAdValidation , ValidateMode ValidateMode)
        {
            switch(ValidateMode)
            {
                case ValidateMode.LeveledUp:

                    await mWatchAdQueryProcessor.AddWatchedInfo(new SWatchedAd
                    {
                        UserID = mUserSession.ID,
                        WatchAdId = WatchAdValidation.WatchAdId,
                        WatchAdProviderId = (int)WatchAdProvider.Tapligh,
                        IsLevel = WatchAdValidation.IsLevel,
                        LevelNumber = WatchAdValidation.LevelNumber,
                        Consumed = true,
                        InsertDate = mDateTime.Now,
                        UpdatedDate = mDateTime.Now
                    });

                    return true;                    

                case ValidateMode.WatchVideo:
                    await mWatchAdQueryProcessor.AddWatchedInfo(new SWatchedAd
                    {
                        UserID = mUserSession.ID,
                        WatchAdId = WatchAdValidation.WatchAdId,
                        WatchAdProviderId = (int)WatchAdProvider.Tapligh,
                        IsLevel = false,
                        LevelNumber = 0,
                        Consumed = true,
                        InsertDate = mDateTime.Now,
                        UpdatedDate = mDateTime.Now
                    });

                    return true;

            }
            return false;   

        }

        private async Task<bool> ValidateThroughTapsell(SWatchAdValidation WatchAdValidation , ValidateMode ValidateMode)
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

            switch (ValidateMode)
            {
                case ValidateMode.WatchVideo:
                    if (result != null)
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

                        return true;
                    }
                    return false;
                       
                case ValidateMode.LeveledUp:

                    if (result != null)
                    {
                        await mWatchAdQueryProcessor.AddWatchedInfo(new SWatchedAd
                        {
                            UserID = mUserSession.ID,
                            WatchAdId = WatchAdValidation.WatchAdId,
                            WatchAdProviderId = (int)WatchAdProvider.TapSell,
                            IsLevel = WatchAdValidation.IsLevel,
                            LevelNumber = WatchAdValidation.LevelNumber,
                            Consumed = result.valid,
                            InsertDate = mDateTime.Now,
                            UpdatedDate = mDateTime.Now
                        });

                        return true;
                    }
                    return false;
            }
            return false;   
        }

        private async Task<bool> ValidateThroughUnityAds(SWatchAdValidation WatchAdValidation , ValidateMode ValidateMode)
        {
            return await Task.FromResult(false);
            //TODO : remember to add unity ads validation based on server to server validation    
        }

    }
}