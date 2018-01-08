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

        [Required]
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

        public Guid NotificationID { get; set; }

        public string IPAddress { get; set; }
    }


        //@SerializedName("Gender")

        //@Expose
        //private Boolean mIsMale;



        //@SerializedName("APILevel")

        //@Expose
        //private String mAPILevel;


        //@SerializedName("Device")

        //@Expose
        //private String mDevice;


        //@SerializedName("Model")

        //@Expose
        //private String mModel;


        //@SerializedName("Platform")

        //@Expose
        //private Integer mPlatform;
}
