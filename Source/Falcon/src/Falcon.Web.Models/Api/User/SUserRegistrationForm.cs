using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.User
{
    public enum PlatformType
    {
        Android = 0 ,
        IOS = 1 ,
    }
    public enum Gender
    {
        Man = 0,
        Woman = 1 ,
    }

    public class SUserRegistrationForm
    {
        public string UUID { get; set;}

        [Required]
        [StringLength(maximumLength: 50, MinimumLength = 3)]
        public string UserName { get; set; }

        [Required]
        public Gender Gender { get; set; }
        
        [Required]
        public string APILevel { get; set; }

        [Required]
        public string Device { get; set; }

        [Required]
        public string Model { get; set; }

        [Required]
        public PlatformType Platform { get; set; }

        [Required]
        public Guid NotificationID { get; set; }

        public string IPAddress { get; set; }
    }

}
