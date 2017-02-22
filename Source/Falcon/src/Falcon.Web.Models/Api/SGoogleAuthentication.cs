using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SGoogleAuthentication
    {
        [EmailAddress(ErrorMessage = "email is not correct")]
        [Required(AllowEmptyStrings = false)]
        public string Email { get; set; }
        public string Credentials { get; set; }
    }
}
