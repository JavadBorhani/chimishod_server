using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Common.Serialization;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Api.Utilities.RestClient;
using Falcon.Web.Models.Api.Notification;
using log4net;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Notification.Private
{
    public class NotificationSystem : INotificationSystem
    {
        private readonly ILog mLogger;
        private readonly IJsonManager mJsonManager;
        private readonly SNotificationConfig mNotificationConfig;
        private readonly IRestClient mRestClient;

        public NotificationSystem(ILogManager LogManager, IJsonManager JsonManager , IRestClient RestClient , INotificationData NotificationConfigData)
        {
            mLogger = LogManager.GetLog(typeof(NotificationSystem));
            mJsonManager = JsonManager;
            mNotificationConfig = NotificationConfigData.GetState();
            mRestClient = RestClient;
        }
        public async Task<ResponseToken> SendToFriend(string[] FriendNotificationIDs)
        {
            
            var requestToken = new RequestToken
            {
                include_player_ids = FriendNotificationIDs,
                app_id = mNotificationConfig.ApplicationID,
                contents = new System.Collections.Generic.Dictionary<string, string>
                {
                    {"en" , mNotificationConfig.FriendRequestMessage }
                }
            };

            if (string.IsNullOrEmpty(mNotificationConfig.EndPointUri))
            {
                return null;
            }


            var requestBody = mJsonManager.SerializeObject(requestToken);
            HttpContent request = new StringContent(requestBody.ToString(), Encoding.UTF8, Constants.MediaTypeNames.ApplicationJson);
            mRestClient.SetAuthorization(mNotificationConfig.AuthenticationKey);

            using (HttpResponseMessage response = await mRestClient.PostAsync(mNotificationConfig.EndPointUri, request))
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
                        if(!string.IsNullOrWhiteSpace(tokenResponse.id))
                        {
                            //200 Ok 
                            tokenResponse.NotificationResponose = NotificationResponseState.Ok;
                        }
                        else
                        {
                            tokenResponse.NotificationResponose = NotificationResponseState.NoSubsribedPlayers;
                            //200 no subscribe users
                        
                        }
                        return tokenResponse;
                    }

                    var tokenError = mJsonManager.DeserializeObject<ErrorToken>(RawFormattedJsonString);

                    if (tokenError != null)
                    {
                        //200 invalid_player_ids
                        return new ResponseToken
                        {
                            NotificationResponose = NotificationResponseState.InvalidPlayerIds,
                            InvalidPlayerIds = tokenError.errors.invalid_player_ids
                        };
                    }

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