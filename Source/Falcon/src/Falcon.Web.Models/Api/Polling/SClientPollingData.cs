using Falcon.Web.Models.Api.Friend;
using Falcon.Web.Models.Api.Notification.Client;
using System.Collections.Generic;

namespace Falcon.Web.Models.Api.Polling
{
    public class SClientPollingData
    {
        public List<SFriendRequest> FriendRequest { get; set; }
        public List<SFriendResponse> FriendResponse { get; set; }
        public List<SQuestionWithAnswerState> InboxQuestion { get; set; }
    }
}
