namespace Falcon.Web.Models.Api.Notification
{
    public class SNotificationConfig
    {
        public string Name { get; set; }
        public string EndPointUri { get; set; }
        public string AuthenticationKey { get; set; }
        public string ApplicationID { get; set; }
        public string FriendRequestMessage { get; set; }
        public string SentRequestMessage { get; set; }
        public string InboxRequestMessage { get; set; }

    }
}
