using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SUserInfo
    {

        [EmailAddress(ErrorMessage = "email is not valid")]
        public string Email { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string UserName { get; set; }

        public bool IsEditable { get; set; }

        [Required(AllowEmptyStrings = false)]
        [IgnoreDataMember]
        public string Password { get; set; }
    }
}
