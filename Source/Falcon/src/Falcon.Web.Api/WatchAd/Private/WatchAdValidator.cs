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
using System.Net;

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

        public async Task<ResponseToken> ValidateWatchAd(string ProviderUri, RequestToken RequestToken)
        {
            if (RequestToken == null || string.IsNullOrEmpty(ProviderUri))
            { 
                return null;
            }

            var request = new FormUrlEncodedContent(new[]
                  {
                    new KeyValuePair<string, string>( nameof(RequestToken.suggestionId), RequestToken.suggestionId),  
                  });


            using (HttpClient client = new HttpClient())
            using (HttpResponseMessage response = await client.PostAsync(ProviderUri, request))
            using (HttpContent content = response.Content)
            {
                HttpStatusCode status = response.StatusCode;
                // ... Read the string.
                string result = await content.ReadAsStringAsync();
                var tokenResponse = CheckHandShakingResponse(status, result, ProviderUri);

                if (tokenResponse != null)
                {
                    return tokenResponse;
                }
            }

            return null;
        }
        private ResponseToken CheckHandShakingResponse(HttpStatusCode StatusCode, string RawFormattedJsonString, string MarketTokenVerifierUri)
        {
            switch (StatusCode)
            {
                case HttpStatusCode.BadRequest:

                    logError(RawFormattedJsonString);

                    break;

                case HttpStatusCode.OK:

                    var tokenResponse = mJsonManager.DeserializeObject<ResponseToken>(RawFormattedJsonString);

                    if (tokenResponse == null)
                        mLogger.Error("Market token verifier Uri is wrong : " + MarketTokenVerifierUri);
                    else
                        return tokenResponse;

                    break;
            }
            return null;
        }

        private void logError(string RawFormattedJsonString)
        {
            ErrorToken issue = mJsonManager.DeserializeObject<ErrorToken>(RawFormattedJsonString);
            mLogger.Error(issue.error);
        }

    }
}
