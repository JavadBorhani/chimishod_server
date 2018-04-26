using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Initialize
{
    public class SInitializeInquiry
    {
        [Required]
        [Range(0 , int.MaxValue)]
        public int LevelVersionCode { get; set; }

        [Required]
        [Range(0 , int.MaxValue)]
        public int QuestVersionCode { get; set; }
    }
}
