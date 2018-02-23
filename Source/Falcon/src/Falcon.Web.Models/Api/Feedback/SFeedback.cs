using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Feedback
{
    public class SFeedback
    {
        [Required]
        public int FeedbackTypeID { get; set; }

        [Required]
        [MaxLength(500)]
        public string Message { get; set; }

    }
}
