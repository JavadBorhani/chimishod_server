using Falcon.Web.Models.Api.Friend;

namespace Falcon.Web.Models.Api.Notification.Client
{
    public class SFriendRequest
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string PictureURL { get; set; }
        public RelationStatus RelationState { get; set; }
    }
}
