using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class SUserInfo
    {

        [EmailAddress(ErrorMessage = "email is not valid")]
        public string Email { get; set; }

        [Required (AllowEmptyStrings = false)]
        public string UserName { get; set; }

        public bool IsEditable { get; set; }

        [Required (AllowEmptyStrings = false)]
        public string Password { get; set; }

        [Required]
        public Guid NotificationID { get; set; }

        public bool HasRegistered { get; set; }
    }
}
