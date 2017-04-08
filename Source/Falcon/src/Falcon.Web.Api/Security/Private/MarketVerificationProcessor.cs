using Falcon.Web.Api.Security.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Security.Private
{
    public class MarketVerificationProcessor : IMarketVerificationProcessor
    {

        public Task<TokenResponse> GetFirstHandShaking(TokenRequest TokenRequest)
        {
            throw new NotImplementedException();
        }

        public Task<TokenResponse> GetTokenWithRefreshToken(RefreshTokenRequest RefreshTokenRequest)
        {
            throw new NotImplementedException();
        }

        public Task<PurchaseVerificationResponse> VerifyPurchase(PurchaseVerificationRequest PurchaseVerificationRequest)
        {
            throw new NotImplementedException();
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