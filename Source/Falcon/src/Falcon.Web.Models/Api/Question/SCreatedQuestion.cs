// Flapp Copyright 2017-2018

using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class SCreatedQuestion
    {
        [Required(AllowEmptyStrings = false)]
        [StringLength(maximumLength: 300, MinimumLength = 3)]
        public string What { get; set; }

        [Required(AllowEmptyStrings = false)]
        [StringLength(maximumLength: 300, MinimumLength = 3)]
        public string But { get; set; }

        [Required]
        public bool IsPublic { get; set; }
       
        [Required]
        public int[] FriendForwardList { get; set; }

        public bool Active { get; set; } // Check if Serialize
        
    }
}
