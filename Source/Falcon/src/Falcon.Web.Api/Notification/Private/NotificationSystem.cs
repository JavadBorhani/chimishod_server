using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Common.Serialization;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Models.Api.Notification;
using log4net;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Notification.Private
{
    public class NotificationSystem : INotificationSystem
    {
        private readonly ILog mLogger;
        private readonly IJsonManager mJsonManager;
        private readonly SNotificationConfig mNotificationConfig;

        public NotificationSystem(ILogManager LogManager, IJsonManager JsonManager , INotificationData NotificationConfigData)
        {
            mLogger = LogManager.GetLog(typeof(NotificationSystem));
            mJsonManager = JsonManager;
            mNotificationConfig = NotificationConfigData.GetState();
        }
        public async Task<ResponseToken> SendToFriend(string[] FriendNotificationIDs)
        {

            var requestToken = new RequestToken
            {
                include_player_ids = FriendNotificationIDs,
                app_id = mNotificationConfig.ApplicationID,
                contents = new string[] { mNotificationConfig.FriendRequestMessage }
            };

            if (requestToken == null || string.IsNullOrEmpty(mNotificationConfig.EndPointUri))
            {
                return null;
            }


            var requestBody = mJsonManager.SerializeObject(requestToken);
            var request = new StringContent(requestBody.ToString(), Encoding.UTF8, Constants.MediaTypeNames.ApplicationJson);


            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add(Constants.MediaTypeNames.Connection, Constants.MediaTypeNames.KeepAlive);
                client.DefaultRequestHeaders.Authorization = AuthenticationHeaderValue.Parse("Basic " + mNotificationConfig.AuthenticationKey);

                using (HttpResponseMessage response = await client.PostAsync(mNotificationConfig.EndPointUri, request))
                using (HttpContent content = response.Content)
                {
                    HttpStatusCode status = response.StatusCode;
                    // ... Read the string.
                    string result = await content.ReadAsStringAsync();
                    var tokenResponse = EvaluateResponse(status, result, mNotificationConfig.EndPointUri);

                    if (tokenResponse != null)
                    {
                        return tokenResponse;
                    }
                }
            }
            

            return null;
        }

        private ResponseToken EvaluateResponse(HttpStatusCode StatusCode, string RawFormattedJsonString, string ProviderUri)
        {
            switch (StatusCode)
            {
                case HttpStatusCode.BadRequest:

                    var responseError = mJsonManager.DeserializeObject<ResponseToken>(RawFormattedJsonString);
                    mLogger.Error(responseError);


                    break;

                case HttpStatusCode.OK:

                    

                    var tokenResponse = mJsonManager.DeserializeObject<ResponseToken>(RawFormattedJsonString);

                    if(tokenResponse != null)
                    {

                    }

                    var tokenError = mJsonManager.DeserializeObject<ErrorToken>(RawFormattedJsonString);

                    if(tokenError != null)
                    {

                    }

                    if (tokenResponse == null)
                        mLogger.Error("Market token verifier Uri is wrong : " + ProviderUri);
                    else
                        return tokenResponse;

                    break;
            }
            return null;
        }

        private void LogError(string RawFormattedJsonString)
        {
            ErrorToken issue = mJsonManager.DeserializeObject<ErrorToken>(RawFormattedJsonString);
            mLogger.Error(issue.errors);
        }
    }
}