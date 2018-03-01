using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class SGoogleAuthentication
    {
        [EmailAddress(ErrorMessage = "email is not correct")]
        [Required(AllowEmptyStrings = false)]
        [StringLength(maximumLength: 200, MinimumLength = 5)]
        public string Email { get; set; }
        public string Credentials { get; set; }
    }
}
