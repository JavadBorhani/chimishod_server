using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.Friend
{
    public class SFriendCharacterDetailInquiry
    {
        [Required]
        [MinLength(1)]
        public int[] UserIDs { get; set; }
    }
}
