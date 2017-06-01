using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.Security.Private
{
    public class SpinItem
    {
        [Required(AllowEmptyStrings = false)]
        public string SpinWheelID { get; set; }
    }
}