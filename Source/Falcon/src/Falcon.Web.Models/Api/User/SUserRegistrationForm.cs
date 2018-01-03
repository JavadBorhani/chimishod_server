using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.User
{
    public enum PlatformType
    {
        Android ,
        IOS,
    }
    public enum Gender
    {
        Man,
        Woman,
    }

    public class SUserRegistrationForm
    {
        [Required]
        public int IPAddress { get; set;}
        [Required]
        public PlatformType Platform { get; set; }
        [Required]
        public string PlatformVersion { get; set; }
        [Required]
        public string IMEI { get; set; }
        [Required]
        public string UserName { get; set; }
        [Required]
        public Gender Gender { get; set; }
        public Guid NotificationID { get; set; }

    }
}
