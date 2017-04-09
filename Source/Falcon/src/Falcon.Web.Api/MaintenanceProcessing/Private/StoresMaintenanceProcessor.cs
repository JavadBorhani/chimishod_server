using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Web.Api.Security.Public;
using Falcon.Data.QueryProcessors;
using Falcon.Common;
using Falcon.Web.Api.Security;
using AutoMapper;
using Falcon.Common.Security;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class StoresMaintenanceProcessor : IStoresMaintenanceProcessor
    {

        private readonly IStoresQueryProcessor mStoresQueryProcessor;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IDateTime mDateTime;
        private readonly IMarketManager mMarketManager;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;

        public StoresMaintenanceProcessor(IMarketVerificationProcessor MarketVerificationProcessor , 
            IStoresQueryProcessor StoresQueryProcessor , 
            IDateTime DateTime , 
            IMarketInfoQueryProcessor MarketInfoQueryProcessor , 
            IMarketManager MarketManager , 
            IMapper Mapper ,
            IWebUserSession UserSession , 
            IUserQueryProcessor UserQueryProcessor)
        {
        
            mStoresQueryProcessor = StoresQueryProcessor;
            mDateTime = DateTime;
            mMarketManager = MarketManager;
            mMapper = Mapper;
            mUserSession = UserSession;
            mUserQueryProcessor = UserQueryProcessor;
        }

        public async Task<SHardCurrencyPurchasedVerification> VerifyPurchase(SHardCurrency HardCurrency)
        {
            var item = await mStoresQueryProcessor.GetStoreItemByID(HardCurrency.StoreItemID);
            if (item != null)
            {
                var purchased = await mStoresQueryProcessor.IsPurchased(HardCurrency.StoreItemID , HardCurrency.PurchasedToken);
                if(!purchased)
                {
                    var market = mMapper.Map<SMarketInfo>(item.MarketInfo);

                    var response = await mMarketManager.PurchaseOperationChecking(new PurchaseVerificationRequest
                    {
                        AccessToken = item.MarketInfo.AccessToken,
                        AppPackageName = item.MarketInfo.AppPackageName,
                        ProductID = item.SKU,
                        Token = HardCurrency.PurchasedToken,
                        VerificationLink = item.MarketInfo.PaymentVerificationLink,
                    } , market);

                    if (response is PurchaseVerificationSuccessful)
                    {
                        var info = (PurchaseVerificationSuccessful)response;
                        if(info.purchaseTime <= 0 || string.IsNullOrEmpty(info.kind))
                        {
                            return null;
                        }

                        var result = await mStoresQueryProcessor.SaveNewPurchase(new EFCommonContext.DbModel.Order
                        {
                            UserID = mUserSession.ID,
                            StoreID = HardCurrency.StoreItemID,
                            ClientPrice = HardCurrency.ClientPrice,
                            ServerPrice = item.Price,
                            PurchasedDate = mDateTime.ConvertEpochToLocalHumanReadable(info.purchaseTime),
                            PurchasedToken = HardCurrency.PurchasedToken,
                            ConsumptionState = info.consumptionState,
                        });

                        int totalCoin = await mUserQueryProcessor.AddCoin(item.Coin);

                        var answer = new SHardCurrencyPurchasedVerification();
                        answer.Authorized = true;
                        answer.TotalCoin = totalCoin;

                        return answer;
                    }
                    else if (response is PurchaseVerificationError)
                    {
                        var info = (PurchaseVerificationError)response;

                        var answer = new SHardCurrencyPurchasedVerification();
                        answer.Authorized = false;
                        answer.Error = info.error;
                        answer.ErrorDescription = info.error_description;

                        return answer;
                    }
                }
            }
            return null;
        }

    }
}