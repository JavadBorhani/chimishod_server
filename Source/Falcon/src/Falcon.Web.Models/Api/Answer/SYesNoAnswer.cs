using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Answer
{
    public class SYesNoAnswer
    {
        [Required]
        public int QuestionID { get; set; }

        [Required]
        public bool IsYes { get; set; }
    }
}
