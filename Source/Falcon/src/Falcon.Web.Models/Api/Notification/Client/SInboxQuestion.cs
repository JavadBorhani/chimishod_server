using System;

namespace Falcon.Web.Models.Api.Notification.Client
{
    public class SInboxQuestion
    {
        public int SenderUserID { get; set; }
        public string SenderUserName { get; set; }
        public string SenderPictureUrl { get; set; }
        public int QuestionID { get; set; }
        public string Whatif { get; set; }
        public string But { get; set; }
        public int YesCount { get; set; }
        public int NoCount { get; set; }
        public int LikeCount { get; set; }
        public int DislikeCount { get; set; }
        public DateTime ForwardDate { get; set; }
    }
}
