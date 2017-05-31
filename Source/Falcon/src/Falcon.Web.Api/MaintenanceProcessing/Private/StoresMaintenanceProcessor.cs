// Flapp Copyright 2017-2018
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
using AutoMapper;
using Falcon.Common.Security;
using static Falcon.Web.Models.Api.SHardCurrencyPurchasedVerification;
using Falcon.Web.Api.PurchaseAuthorizer;
using Falcon.Web.Api.PurchaseAuthorizer.Public;
using Falcon.Web.Api.PurchaseAuthorizer.Private;

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
                var answer = new SHardCurrencyPurchasedVerification();

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
                            PurchaseState = info.purchaseState,
                            ConsumptionState = info.consumptionState,
                            IsFailed = false,                       
                        });

                        int totalCoin = await mUserQueryProcessor.IncreaseCoin(item.Coin);

                        answer.IsValid = true;
                        answer.TotalCoin = totalCoin;
                        answer.ErrorCode = ErrorCodeType.None;
                        answer.StoreItemId = HardCurrency.StoreItemID;

                        return answer;
                    }
                    else if (response is PurchaseVerificationError)
                    {
                        var info = (PurchaseVerificationError)response;

                        var result = await mStoresQueryProcessor.SaveNewPurchase(new EFCommonContext.DbModel.Order
                        {
                            UserID = mUserSession.ID,
                            StoreID = HardCurrency.StoreItemID,
                            ClientPrice = HardCurrency.ClientPrice,
                            ServerPrice = item.Price,
                            PurchasedToken = HardCurrency.PurchasedToken,
                            IsFailed = true,
                            ErrorCode = info.error,
                            ErrorDescription = info.error_description,
                        });

                        answer.IsValid = false;
                        answer.StoreItemId = HardCurrency.StoreItemID;
                        answer.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                        if (Constants.MarketMessages.TokenExpire.Contains(info.error_code))
                        {
                            answer.ErrorCode = ErrorCodeType.TokenExpired;
                        }
                        else
                        {
                            answer.ErrorCode = ErrorCodeType.Other;
                        }
                        return answer;
                    }
                }
                else
                {
                    answer.IsValid = true;
                    answer.StoreItemId = HardCurrency.StoreItemID; 
                    answer.TotalCoin = await mUserQueryProcessor.GetTotalCoin();

                    return answer;
                }
            }
            return null;
        }
    }
}