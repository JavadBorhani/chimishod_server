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
            IWebUserSession UserSession)
        {
        
            mStoresQueryProcessor = StoresQueryProcessor;
            mDateTime = DateTime;
            mMarketManager = MarketManager;
            mMapper = Mapper;
            mUserSession = UserSession; 
        }

        public async Task<bool> VerifyPurchase(SHardCurrency HardCurrency)
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
                        var info = (PurchaseVerificationSuccessful) response;
                        //var result = await mStoresQueryProcessor.SaveNewPurchase(new EFCommonContext.DbModel.Order
                        //{
                        //    ConsumptionState = info.consumptionState,
                        //    PurchasedToken = HardCurrency.PurchasedToken,
                        //    StoreID = HardCurrency.StoreItemID,
                        //    UserID = mUserSession.ID,
                        //    PriceID = 2000
                        //});
                    }
                    else if (response is PurchaseVerificationError)
                    {
                        var info = (PurchaseVerificationError) response;
                    }
                }
            }
            return false;
        }

    }
}