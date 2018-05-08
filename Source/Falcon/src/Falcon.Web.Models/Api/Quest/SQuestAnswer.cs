using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Quest
{
    public class SQuestAnswer
    {
        public int UserID { get; set; }

        [Required]
        [Range(0 , int.MaxValue)]
        public int QuestNumber { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public int QuestionID { get; set; }

        [Required]
        public bool? Liked { get; set; }

        [Required]
        public bool? Dislike { get; set; }

        [Required]
        public bool YesNoState { get; set; }

        public DateTime CreatedDate { get; set; }
    }
}
