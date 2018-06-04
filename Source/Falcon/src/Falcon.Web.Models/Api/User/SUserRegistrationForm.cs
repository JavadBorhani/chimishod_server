using Falcon.Web.Models.Validation;
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


        private string mUserName;

        [Required]
        [StringLength(maximumLength: 40, MinimumLength = 3)]
        public string UserName
        {
            get
            {
                return mUserName;   
            }
            set
            {
                mUserName = value.Trim();
            }
        }

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

        [Guid]
        public string NotificationID { get; set; }
        
        public string IPAddress { get; set; }
    }

}
