using Falcon.Web.Api.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;
using log4net;
using Falcon.Common.Logging;
using Falcon.Common.Serialization;
using System.Net.Http;
using Falcon.Web.Api.WatchAd.Public;

namespace Falcon.Web.Api.WatchAd.Private
{
    public class WatchAdValidator : IWatchAdValidator
    {
        private readonly ILog mLogger;
        private readonly IJsonManager mJsonManager;

        public WatchAdValidator(ILogManager LogManager, IJsonManager JsonManager)
        {
            mLogger = LogManager.GetLog(typeof(WatchAdValidator));
            mJsonManager = JsonManager;
        }
        public Task<int> ValidateWatchAd(SWatchAdValidation WatchAdValidation)
        {
            return null;
            //if (TokenRequest == null || string.IsNullOrEmpty(MarketTokenVerifierUri))
            //{
            //    return null;
            //}

            //if (string.IsNullOrEmpty(TokenRequest.code) ||
            //    string.IsNullOrEmpty(TokenRequest.client_id) ||
            //    string.IsNullOrEmpty(TokenRequest.client_secret) ||
            //    string.IsNullOrEmpty(TokenRequest.redirect_uri))
            //{
            //    return null;
            //}

            //var jsonMap = new FormUrlEncodedContent(new[]
            //      {
            //        new KeyValuePair<string, string>( nameof(TokenRequest.grant_type), TokenRequest.grant_type),
            //        new KeyValuePair<string, string>( nameof(TokenRequest.code), TokenRequest.code),
            //        new KeyValuePair<string, string>( nameof(TokenRequest.client_id), TokenRequest.client_id),
            //        new KeyValuePair<string, string>( nameof(TokenRequest.client_secret), TokenRequest.client_secret),
            //        new KeyValuePair<string, string>( nameof(TokenRequest.redirect_uri), TokenRequest.redirect_uri)
            //    });

            //string test = mJsonManager.SerializeObject(TokenRequest);

            //using (HttpClient client = new HttpClient())
            //using (HttpResponseMessage response = await client.PostAsync(MarketTokenVerifierUri, jsonMap))
            //using (HttpContent content = response.Content)
            //{
            //    HttpStatusCode status = response.StatusCode;
            //    // ... Read the string.
            //    string result = await content.ReadAsStringAsync();
            //    var tokenResponse = CheckHandShakingResponse(status, result, MarketTokenVerifierUri);
            //    if (tokenResponse != null)
            //    {
            //        return tokenResponse;
            //    }
            //}

            //return null;
        }

    }
}
