// Flapp Copyright 2017-2018
using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.Security.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Data.Exceptions;
using Falcon.Web.Api.PurchaseAuthorizer.Public;

namespace Falcon.Web.Api.PurchaseAuthorizer.Private
{
    public class MarketManager : IMarketManager
    {
        private readonly IMarketInfoQueryProcessor mMarketInfoQueryProcessor;
        private readonly IMarketVerificationProcessor mMarketVerificationProcessor;
        private readonly IDateTime mDateTime;

        public MarketManager(IDateTime DateTime , 
            IMarketVerificationProcessor MarketVerificationProcssor , 
            IMarketInfoQueryProcessor MarketInfoQueryProcessor)
        {
            mMarketVerificationProcessor = MarketVerificationProcssor;
            mMarketInfoQueryProcessor = MarketInfoQueryProcessor;
            mDateTime = DateTime;
        }
        //TODO : Add Subscription Checking in a separate function 
        public async Task<PurchaseVerificationResponse> PurchaseOperationChecking(PurchaseVerificationRequest PurchaseVerificationRequest, SMarketInfo MarketInfo)
        {
            if(!MarketInfo.NeedsTokenVerification)
            {
                var response = await mMarketVerificationProcessor.VerifyPurchase(PurchaseVerificationRequest , true);
                return response;
            }


            if(string.IsNullOrWhiteSpace(MarketInfo.RefreshToken) || string.IsNullOrWhiteSpace(MarketInfo.AccessToken)) // it's the first time to get access and refresh code
            {
                var tokenResponse = await mMarketVerificationProcessor.GetFirstHandShaking(MarketInfo.LinkToAuthorize, new TokenRequest
                {
                    client_id = MarketInfo.ClientID,
                    client_secret = MarketInfo.ClientSecret,
                    redirect_uri = MarketInfo.RedirectURI,
                    code = MarketInfo.Code
                });

                if(tokenResponse != null)
                {
                    await mMarketInfoQueryProcessor.SaveNewVerificationData(MarketInfo.ID, tokenResponse.access_token, tokenResponse.refresh_token, tokenResponse.expires_in);
                    MarketInfo.AccessToken = tokenResponse.access_token;
                    MarketInfo.RefreshToken = tokenResponse.refresh_token;
                    MarketInfo.ExpireAt = mDateTime.Now.AddSeconds(tokenResponse.expires_in);
                }
                else
                {
                    throw new PaymentSystemException("can not retrieve access token and refresh token with this code " + MarketInfo.Code);
                }
            }

            if(mDateTime.Now > MarketInfo.ExpireAt) // Time to get a new access token
            {
                var tokenResponse = await mMarketVerificationProcessor.GetTokenWithRefreshToken(MarketInfo.LinkToAuthorize, new RefreshTokenRequest
                {
                    client_id = MarketInfo.ClientID,
                    client_secret = MarketInfo.ClientSecret,
                    refresh_token = MarketInfo.RefreshToken
                });

                if(tokenResponse != null)
                {
                    await mMarketInfoQueryProcessor.SaveNewVerificationData(MarketInfo.ID, tokenResponse.access_token, MarketInfo.RefreshToken, tokenResponse.expires_in);
                    MarketInfo.AccessToken = tokenResponse.access_token;
                    MarketInfo.ExpireAt = mDateTime.Now.AddSeconds(tokenResponse.expires_in);
                }
                else
                {
                    throw new PaymentSystemException("can not retrieve new access token with this refresh token" + MarketInfo.RefreshToken);
                }
            }

            PurchaseVerificationRequest.AccessToken = MarketInfo.AccessToken;
            var result = await mMarketVerificationProcessor.VerifyPurchase(PurchaseVerificationRequest);

            return result;  
        }

    }
}