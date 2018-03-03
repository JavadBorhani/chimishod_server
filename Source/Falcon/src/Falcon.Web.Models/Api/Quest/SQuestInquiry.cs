using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Quest
{
    public class SQuestInquiry
    {
        [Required]
        public int QuestNumber { get; set; }

        [Required]
        public int LevelNumber { get; set; }

        [Range(0 , int.MaxValue)]
        public int FriendID { get; set; }

        [Required]
        public bool Alive { get; set; }
    }
}
