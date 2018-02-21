using System.Collections.Generic;

namespace Falcon.Web.Models.Api.Notification.Client
{
    public class SFriendStatus
    {
        public List<SFriendRequest> FriendRequst { get; set; }
        public List<SFriendResponse> FriendResponse { get; set; }
    }
}
