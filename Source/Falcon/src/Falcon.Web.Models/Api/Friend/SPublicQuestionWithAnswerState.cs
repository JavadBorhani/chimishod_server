using System;

namespace Falcon.Web.Models.Api.Friend
{
    public enum AnswerState
    {
        None,
        Yes,
        No,
    }
    public enum LikeState
    {
        None,
        Liked,
        Disliked,
    }
    public class UserCommonData
    {
        public int UserID { get; set;}
        public string UserName { get; set; }
        public string PictureUrl { get; set; }
    }
    public class SPublicQuestionWithAnswerState
    {
        public int ID { get; set; }
        public string What_if { get; set; }
        public string But { get; set; }
        public int Yes_Count { get; set; }
        public int No_Count { get; set; }
        public int Like_Count { get; set; }
        public int Dislike_Count { get; set; }
        public DateTime CreatedDate { get; set; }

        public bool AnsweredLiked { get; set; }
        public bool AnsweredDisliked { get; set; }
        public bool AnsweredYes { get; set; }
        public bool AnsweredNo { get; set; }
    }
}
