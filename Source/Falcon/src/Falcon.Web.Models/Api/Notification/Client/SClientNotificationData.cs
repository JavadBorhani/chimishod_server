using System;
using System.Collections.Generic;

namespace Falcon.Web.Models.Api.Notification.Client
{
    public enum NotificationType
    {
        GeneralMessage = 1,
        FriendRequest = 2,
        FriendResponse = 3,
        InboxQuestion = 4,
        SentQuestion = 5,
    }

    public class SClientNotificationData
    {
        public List<SFriendRequest> FriendRequest { get; set; }
        public NotificationType Type { get; set; }
        public DateTime ServerDate { get; set; }
    }
}
