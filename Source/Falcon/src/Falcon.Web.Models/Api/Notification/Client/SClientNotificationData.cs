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
        QuestionState = 5,
        BanQuestion = 6,
        SentQuestion = 7,
    }

    public sealed class NotificationSegments
    {
        public const string All = "All";
        public const string ActiveUsers = "Active Users";

    }
    public class SClientNotificationData
    {
        public List<SFriendRequest>             FriendRequest { get; set; }
        public List<SFriendResponse>            FriendResponse { get; set; }
        public List<SSentQuestion>              SentQuestion { get; set; }
        public List<SInboxQuestion>             InboxQuestion{ get; set; }
        public List<SQuestionStateNotification> QuestionState { get; set; }
        public List<int>                        BanQuestion { get; set; }
        public NotificationType                 Type { get; set; }
        public DateTime                         ServerDate { get; set; }
    }
}
