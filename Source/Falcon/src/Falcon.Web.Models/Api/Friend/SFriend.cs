namespace Falcon.Web.Models.Api.Friend
{
    public enum RelationStatus
    {
        Pending,
        Accepted , 
        Rejected ,
        Blocked,
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
