using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Answer
{
    public class SFriendAnswerInquiry
    {
        [Required]
        public int QuestionID { get; set; }
        [Required]
        [MinLength(1)]
        public int[] FriendIDs { get; set; }
    }
}
