using Falcon.Client.App.Utils;
using RestSharp;
using System;

namespace Falcon.Client.App.Logic
{
    public class RestClientManager : IServerRequests
    {

        private RestClient mClient;
        
        public RestClientManager(string URLPath)
        {
            mClient = new RestClient(URLPath);            
        }

        public void CreateUserAsync(string UUID, Action<IRestResponse> Callback)
        {
            var request = RequestUtils.CreateRequest("/UserAuthenticator" , Method.GET , UUID);
            mClient.ExecuteAsync(request, response =>
            {
               Callback.Invoke(response);
            });
            
        }

        public void SendAnswerAsync(string UUID, int QuestionID, bool Yes, bool Like, bool Dislike , Action<IRestResponse> Callback)
        {
            var request = RequestUtils.CreateRequest("Answers/Answer", Method.POST, UUID , new
            {
                QuestionID = QuestionID,
                Like = Like,
                Dislike = Dislike,
                YesNoState = Yes, 
            });

            mClient.ExecuteAsync(request , res =>
            {
                Callback.Invoke(res);
            });
        }

        public void SendNotification(string UUID, Action<IRestResponse> Callback)
        {
            var request = RequestUtils.CreateRequest("/v2/TestController/", Method.GET , UUID );

            mClient.ExecuteAsync(request, res =>
            {
               Callback.Invoke(res);
            });
        }
    }
}
