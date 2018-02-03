namespace Falcon.Web.Models.Api.Notification
{
    //public class ModelObligationData
    //{
    //    public string Title { get; set; }
    //    public string Description { get; set; }
    //    public string ImagePath { get; set; }

    //}

    //public class SNotificationConfig
    //{
    //    public string Name { get; set; }
    //    public string EndPointUri { get; set; }
    //    public string AuthenticationKey { get; set; }
    //    public string ApplicationID { get; set; }
    //    public ModelObligationData FriendRequest { get; set; }
    //    public ModelObligationData SentRequest { get; set; }
    //    public ModelObligationData InboxRequest { get; set; }
    //    public ModelObligationData FriendResponse { get; set; }

    //}


    public class SNotificationConfig
    {
        public string Name { get; set; }
        public string EndPointUri { get; set; }
        public string AuthenticationKey { get; set; }
        public string ApplicationID { get; set; }
        public string FriendRequest_Title { get; set; }
        public string FriendRequest_Image { get; set; }
        public string FriendRequest_Description { get; set; }
        public string SentRequest_Title{ get; set; }
        public string SentRequest_Image{ get; set; }
        public string SentRequest_Description{ get; set; }
        public string InboxRequest_Title { get; set; }
        public string InboxRequest_Image{ get; set; }
        public string InboxRequest_Description{ get; set; }
        public string FriendResponse_Title{ get; set; }
        public string FriendResponse_Description{ get; set; }
        public string FriendResponse_Image{ get; set; }

    }
}
