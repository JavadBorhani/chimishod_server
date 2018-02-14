namespace Falcon.Web.Models.Api.Friend
{
    public class SFriendAnswer : UserCommonData
    {
        public int QuestionID { get; set; }
        public bool AnsweredLiked { get; set; }
        public bool AnsweredDisliked { get; set; }
        public bool AnsweredYes { get; set; }
        public bool AnsweredNo { get; set; }
    }
}
