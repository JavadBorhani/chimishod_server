using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Answer
{
    public class SLikeDislikeAnswer
    {

        [Required]
        public int QuestionID { get; set; }

        [Required]
        public bool IsLiked { get; set; }

    }
}
