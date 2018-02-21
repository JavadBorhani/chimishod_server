using Falcon.Web.Models.Api.Friend;
using Falcon.Web.Models.Api.Notification.Client;
using System.Collections.Generic;

namespace Falcon.Web.Models.Api.Polling
{
    public class SClientPollingData
    {
        public List<SFriendRequest> FriendRequests { get; set; }
        public List<SFriendResponse> FriendResponses { get; set; }
        public List<SQuestionWithAnswerState> InboxQuestions { get; set; }
    }
}
