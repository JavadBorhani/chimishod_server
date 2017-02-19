using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SUserInfo
    {
        public string Email { get; set; }
        public string UserName { get; set; }

        public bool IsEditable { get; set; }

        [IgnoreDataMember]
        public string Password { get; set; }
    }
}
