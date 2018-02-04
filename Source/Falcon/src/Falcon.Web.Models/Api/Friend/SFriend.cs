namespace Falcon.Web.Models.Api.Friend
{
    public enum RelationStatus
    {
        Accepted = 1  , 
        Rejected = 2 ,
        Pending = 3 ,
        Blocked = 4 ,
        None = 5 ,
    }

    public class SFriend
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string UserPictureUrl { get; set; }
        public RelationStatus Status { get; set; }
        public bool RelationOperatorIsMe { get; set; }
    }
}
