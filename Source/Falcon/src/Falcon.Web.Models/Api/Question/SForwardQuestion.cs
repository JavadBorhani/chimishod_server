using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Question
{
    public class SForwardQuestion
    {
        [Required]
        public int QuestionID { get; set; }

        [Required]
        [MinLength(1)]
        public int[] FriendIDs { get; set; }
    }
}
