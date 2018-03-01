using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.User
{
    public class SNewUserInfo
    {
        [EmailAddress(ErrorMessage = "email is not valid")]
        [StringLength(maximumLength: 200, MinimumLength = 5)]
        public string Email { get; set; }

        [Required(AllowEmptyStrings = false)]
        [StringLength(maximumLength: 40, MinimumLength = 3)]
        public string UserName { get; set; }

        public bool IsEditable { get; set; }

        [Required(AllowEmptyStrings = false)]
        [StringLength(maximumLength: 50, MinimumLength = 6)]
        public string Password { get; set; }

        public bool HasRegistered { get; set; }


    }
}
