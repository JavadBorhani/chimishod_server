﻿using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api.User
{
    public class SNewUserInfo
    {
        [EmailAddress(ErrorMessage = "email is not valid")]
        public string Email { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string UserName { get; set; }

        public bool IsEditable { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Password { get; set; }

        public bool HasRegistered { get; set; }


    }
}
