using Falcon.Web.Models.Api.User;
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

        public Guid NotificationID { get; set; }

        public bool HasRegistered { get; set; }

        [Required]
        public string APILevel { get; set; }

        [Required]
        public string Device { get; set; }

        [Required]
        public string Model { get; set; }

        [Required]
        public PlatformType Platform { get; set; }
    }
}
