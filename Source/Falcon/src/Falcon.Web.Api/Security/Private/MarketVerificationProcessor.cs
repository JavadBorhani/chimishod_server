using Falcon.Web.Api.Security.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net;
using Newtonsoft.Json;
using log4net.Core;
using Falcon.Common.Logging;
using log4net;
using Falcon.Common.Serialization;

namespace Falcon.Web.Api.Security.Private
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

        public async Task<TokenResponse> GetFirstHandShaking(string MarketTokenVerifierUri, TokenRequest TokenRequest)
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

        public async Task<PurchaseVerificationResponse> VerifyPurchase(PurchaseVerificationRequest PurchaseVerificationRequest)
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
                PurchaseVerificationRequest.Token)
                + "access_token=" + PurchaseVerificationRequest.AccessToken;

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
            string error = mJsonManager.DeserializeObject<string>(RawFormattedJsonString);
            mLogger.Error(error);
        }

    }

    //class Program
    //{
    //    //        ID MarketName  AppPackageName PaymentVerificationLink LinkToAuthorize ClientID    ClientSecret AccessToken RefreshToken RedirectURI ExpireAt NeedsTokenVerification  CreatedDate UpdatedDate
    //    //        1	CafeBazzar 		uxbmnAGS1zzFxWjHquyBZ97zoI0z9oWNu4YNrlEB	GIFjdx760ZKC0h6qdEdQbjGPhMkWVgWsDOrSHYOvRDn3zt71SSet6IR5cpCM	aR0aoEMSLZRgm0nQBUokfepb6atgPe	OMJ4lWiIXrxMTqnUe0pUdeACmqog7w	NULL	2017-04-04 00:00:00.000	1	2017-04-04 00:00:00.000	2017-04-04 00:00:00.000
    //    // com.bms.whatif  
    //    // https://pardakht.cafebazaar.ir/devapi/v2/api/validate/{0}/inapp/{1}/purchases/{2}/
    //    // https://pardakht.cafebazaar.ir/devapi/v2/auth/token/
    //    //
    //    //

    //    static void Main(string[] args)
    //    {
    //        Task t = new Task(RefreshCode);
    //        t.Start();
    //        Console.WriteLine("downloading");
    //        Console.ReadLine();
    //    }

    //    static async void GetFirstHandShake()
    //    {
    //        const string grant_type = "authorization_code";
    //        string code = "MBUosevjUYWpRLEHZvEbSja8yy4uDu";
    //        string client_id = "uxbmnAGS1zzFxWjHquyBZ97zoI0z9oWNu4YNrlEB";
    //        string client_secret = "GIFjdx760ZKC0h6qdEdQbjGPhMkWVgWsDOrSHYOvRDn3zt71SSet6IR5cpCM";
    //        string redirect_uri = "http://www.api.vglr.ir/auth";

    //        //string accessToken = "RV2cx19LMbZo41ieYmstfFPtVqznZB";

    //        var contentOne = new FormUrlEncodedContent(new[]
    //            {
    //                new KeyValuePair<string, string>( nameof(grant_type), grant_type),
    //                new KeyValuePair<string, string>( nameof(code), code),
    //                new KeyValuePair<string, string>( nameof(client_id), client_id),
    //                new KeyValuePair<string, string>( nameof(client_secret), client_secret),
    //                new KeyValuePair<string, string>( nameof(redirect_uri), redirect_uri)
    //            });

    //        //string request = "?access_token=" + accessToken;
    //        string request = "https://pardakht.cafebazaar.ir/devapi/v2/auth/token/";

    //        using (HttpClient client = new HttpClient())
    //        using (HttpResponseMessage response = await client.PostAsync(request, contentOne))
    //        using (HttpContent content = response.Content)
    //        {
    //            HttpStatusCode status = response.StatusCode;
    //            // ... Read the string.
    //            string result = await content.ReadAsStringAsync();

    //        }
    //    }
    //    static async void RefreshCode()
    //    {
    //        const string grant_type = "refresh_token";
    //        string client_id = "uxbmnAGS1zzFxWjHquyBZ97zoI0z9oWNu4YNrlEB";
    //        string client_secret = "GIFjdx760ZKC0h6qdEdQbjGPhMkWVgWsDOrSHYOvRDn3zt71SSet6IR5cpCM";
    //        string refresh_token = "pxuFFs4pdQFI3hOQffhE5uGBLNVUfn";

    //        //string accessToken = "RV2cx19LMbZo41ieYmstfFPtVqznZB";

    //        var contentOne = new FormUrlEncodedContent(new[]
    //            {
    //                new KeyValuePair<string, string>( nameof(grant_type), grant_type),
    //                new KeyValuePair<string, string>( nameof(client_id), client_id),
    //                new KeyValuePair<string, string>( nameof(client_secret), client_secret),
    //                new KeyValuePair<string, string>( nameof(refresh_token), refresh_token)
    //            });

    //        //string request = "?access_token=" + accessToken;
    //        string request = "https://pardakht.cafebazaar.ir/devapi/v2/auth/token/";

    //        using (HttpClient client = new HttpClient())
    //        using (HttpResponseMessage response = await client.PostAsync(request, contentOne))
    //        using (HttpContent content = response.Content)
    //        {
    //            HttpStatusCode status = response.StatusCode;
    //            // ... Read the string.
    //            string result = await content.ReadAsStringAsync();

    //        }
    //    }

    //    static async void CheckPurchase()
    //    {

    //        string packageName = "com.bms.what_if";
    //        string accessToken = "RV2cx19LMbZo41ieYmstfFPtVqznZB";
    //        string SKU = "seke100";
    //        string Token = "L3Fxsjro1wGzjWEz";//z
    //        string request = string.Format("https://pardakht.cafebazaar.ir/devapi/v1/api/validate/{0}/inapp/{1}/purchases/{2}/", packageName, SKU, Token) + "?access_token=" + accessToken;

    //        // ... Use HttpClient.
    //        using (HttpClient client = new HttpClient())
    //        using (HttpResponseMessage response = await client.GetAsync(request))
    //        using (HttpContent content = response.Content)
    //        {
    //            HttpStatusCode status = response.StatusCode;
    //            // ... Read the string.
    //            string result = await content.ReadAsStringAsync();

    //        }

    //    }
    //}
}