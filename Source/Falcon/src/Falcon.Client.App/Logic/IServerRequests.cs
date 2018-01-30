using RestSharp;
using System;

namespace Falcon.Client.App.Logic
{
    public interface IServerRequests
    {
        void SendAnswerAsync(string UUID, int QuestionID, bool Yes , bool Like , bool Dislike, Action<IRestResponse> Callback);
        void CreateUserAsync(string UUID , Action<IRestResponse> Callback);
        void SendNotification(string UUID, Action<IRestResponse> Callback);
    }
}
