using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Common.Serialization;
using Falcon.Web.Api.WatchAd.Public;
using log4net;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

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
            

            var requestBody = mJsonManager.SerializeObject(RequestToken);
            var request = new StringContent(requestBody.ToString(), Encoding.UTF8, Constants.MediaTypeNames.ApplicationJson);

            
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
        private ResponseToken CheckHandShakingResponse(HttpStatusCode StatusCode, string RawFormattedJsonString, string ProviderUri)
        {
            switch (StatusCode)
            {
                case HttpStatusCode.BadRequest:

                    logError(RawFormattedJsonString);

                    break;

                case HttpStatusCode.OK:

                    var tokenResponse = mJsonManager.DeserializeObject<ResponseToken>(RawFormattedJsonString);

                    if (tokenResponse == null)
                        mLogger.Error("Market token verifier Uri is wrong : " + ProviderUri);
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
