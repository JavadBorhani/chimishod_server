using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Quest
{
    public class SQuestInquiry
    {
        [Required]
        public int QuestNumber { get; set; }

        public int FriendID { get; set; }
    }
}
