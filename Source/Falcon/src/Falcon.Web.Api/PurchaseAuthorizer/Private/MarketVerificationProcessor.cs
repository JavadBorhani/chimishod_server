// Flapp Copyright 2017-2018
using Falcon.Common.Logging;
using Falcon.Common.Serialization;
using Falcon.Web.Api.PurchaseAuthorizer.Public;
using log4net;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace Falcon.Web.Api.PurchaseAuthorizer.Private
{
    public class MarketVerificationProcessor : IMarketVerificationProcessor
    {

        private readonly ILog mLogger;
        private readonly IJsonManager mJsonManager;

        public MarketVerificationProcessor(ILogManager LogManager , IJsonManager JsonManager)
        {
            mLogger = LogManager.GetLog(typeof(MarketVerificationProcessor));
            mJsonManager = JsonManager; 
        }

        public async Task<TokenResponse> AuthorizeWithHandshaking(string MarketTokenVerifierUri, TokenRequest TokenRequest)
        {
            
            if(TokenRequest == null || string.IsNullOrEmpty(MarketTokenVerifierUri))
            {
                return null;
            }

            if (string.IsNullOrEmpty(TokenRequest.code) || 
                string.IsNullOrEmpty(TokenRequest.client_id) ||
                string.IsNullOrEmpty(TokenRequest.client_secret) || 
                string.IsNullOrEmpty(TokenRequest.redirect_uri))
            {
                return null;
            }

            var jsonMap = new FormUrlEncodedContent(new[]
                  {
                    new KeyValuePair<string, string>( nameof(TokenRequest.grant_type), TokenRequest.grant_type),
                    new KeyValuePair<string, string>( nameof(TokenRequest.code), TokenRequest.code),
                    new KeyValuePair<string, string>( nameof(TokenRequest.client_id), TokenRequest.client_id),
                    new KeyValuePair<string, string>( nameof(TokenRequest.client_secret), TokenRequest.client_secret),
                    new KeyValuePair<string, string>( nameof(TokenRequest.redirect_uri), TokenRequest.redirect_uri)
                });

            string test = mJsonManager.SerializeObject(TokenRequest);

            using (HttpClient client = new HttpClient())
            using (HttpResponseMessage response = await client.PostAsync(MarketTokenVerifierUri, jsonMap))
            using (HttpContent content = response.Content)
            {
                HttpStatusCode status = response.StatusCode;
                // ... Read the string.
                string result = await content.ReadAsStringAsync();
                var tokenResponse = CheckHandShakingResponse(status, result , MarketTokenVerifierUri);
                if(tokenResponse != null)
                {
                    return tokenResponse;
                }
            }

            return null;
        }

        public async Task<TokenResponse> GetTokenWithRefreshToken(string MarketTokenVerifierUri , RefreshTokenRequest RefreshTokenRequest)
        {
            if (RefreshTokenRequest == null || string.IsNullOrEmpty(MarketTokenVerifierUri))
            {
                return null;
            }
            if (string.IsNullOrEmpty(RefreshTokenRequest.refresh_token) ||
                string.IsNullOrEmpty(RefreshTokenRequest.client_id) ||
                string.IsNullOrEmpty(RefreshTokenRequest.client_secret))
            {
                return null;
            }

            
            var jsonMap = new FormUrlEncodedContent(new[]
                {
                    new KeyValuePair<string, string>( nameof(RefreshTokenRequest.grant_type),       RefreshTokenRequest.grant_type),
                    new KeyValuePair<string, string>( nameof(RefreshTokenRequest.client_id),        RefreshTokenRequest.client_id),
                    new KeyValuePair<string, string>( nameof(RefreshTokenRequest.client_secret),    RefreshTokenRequest.client_secret),
                    new KeyValuePair<string, string>( nameof(RefreshTokenRequest.refresh_token),    RefreshTokenRequest.refresh_token)
                });            

            using (HttpClient client = new HttpClient())
            using (HttpResponseMessage response = await client.PostAsync(MarketTokenVerifierUri, jsonMap))
            using (HttpContent content = response.Content)
            {
                HttpStatusCode status = response.StatusCode;
                // ... Read the string.
                string result = await content.ReadAsStringAsync();
                var tokenResponse = CheckNewAccessTokenResponse(status, result, MarketTokenVerifierUri);
                if(tokenResponse != null)
                {
                    return tokenResponse;
                }
            }
            return null;
        }

        public async Task<PurchaseVerificationResponse> VerifyPurchase(PurchaseVerificationRequest PurchaseVerificationRequest , bool IgnoreAccessToken)
        {
            if(PurchaseVerificationRequest == null || 
                string.IsNullOrEmpty(PurchaseVerificationRequest.AppPackageName) ||
                string.IsNullOrEmpty(PurchaseVerificationRequest.AccessToken) || 
                string.IsNullOrEmpty(PurchaseVerificationRequest.ProductID) || 
                string.IsNullOrEmpty(PurchaseVerificationRequest.Token))
            {
                return null;    
            }
            var request = string.Format(PurchaseVerificationRequest.VerificationLink,
                PurchaseVerificationRequest.AppPackageName,
                PurchaseVerificationRequest.ProductID,
                PurchaseVerificationRequest.Token);

            if (!IgnoreAccessToken)
                request += "?access_token=" + PurchaseVerificationRequest.AccessToken; 

            using (HttpClient client = new HttpClient())
            using (HttpResponseMessage response = await client.GetAsync(request))
            using (HttpContent content = response.Content)
            {
                HttpStatusCode status = response.StatusCode;
                // ... Read the string.
                string result = await content.ReadAsStringAsync();

                var verifyResponse = CheckPurchaseVerification(status, result);
                if(verifyResponse != null)
                {
                    return verifyResponse;
                }
            }
            return null;
        }

        #region LogicFunctions

        private PurchaseVerificationResponse CheckPurchaseVerification(HttpStatusCode StatusCode , string RawFormattedJsonString)
        {
            if(RawFormattedJsonString.IndexOf("error") != -1 && StatusCode == HttpStatusCode.OK)
            {
                StatusCode = HttpStatusCode.NotFound;
            }

            switch(StatusCode)
            {
                case HttpStatusCode.NotFound:
                case HttpStatusCode.Unauthorized:
                    PurchaseVerificationError error = mJsonManager.DeserializeObject<PurchaseVerificationError>(RawFormattedJsonString);
                    if(error != null)
                    {
                        return error;
                    }
                    break;

                case HttpStatusCode.OK:

                    PurchaseVerificationSuccessful success = mJsonManager.DeserializeObject<PurchaseVerificationSuccessful>(RawFormattedJsonString);
                    if (success != null)
                        return success;

                    break;
            }
            return null;    
        }

        private TokenResponse CheckNewAccessTokenResponse(HttpStatusCode StatusCode,string RawFormattedJsonString, string MarketTokenVerifierUri)
        {
            switch(StatusCode)
            {
                case HttpStatusCode.BadRequest:
                    logError(RawFormattedJsonString);
                    break;

                case HttpStatusCode.Unauthorized:
                    logError(RawFormattedJsonString);
                    break;

                case HttpStatusCode.OK:
                    var tokenResponse = mJsonManager.DeserializeObject<TokenResponse>(RawFormattedJsonString);
                    if(tokenResponse != null)
                    {
                        return tokenResponse;
                    }
                    break;
            }
            return null;
        }

        private TokenResponse CheckHandShakingResponse( HttpStatusCode StatusCode, string RawFormattedJsonString, string MarketTokenVerifierUri)
        {
            switch (StatusCode)
            {
                case HttpStatusCode.Unauthorized:

                    logError(RawFormattedJsonString);

                    break;

                case HttpStatusCode.BadRequest:

                    logError(RawFormattedJsonString);

                    break;

                case HttpStatusCode.OK:

                    var tokenResponse = mJsonManager.DeserializeObject<TokenResponse>(RawFormattedJsonString);

                    if (tokenResponse == null)
                        mLogger.Error("Market token verifier Uri is wrong : " + MarketTokenVerifierUri);
                    else
                        return tokenResponse;

                    break;
            }
            return null;
        }
            
        #endregion

        private void logError(string RawFormattedJsonString)
        {
            TokenError issue = mJsonManager.DeserializeObject<TokenError>(RawFormattedJsonString);
            mLogger.Error(issue.error);
        }

    }
}