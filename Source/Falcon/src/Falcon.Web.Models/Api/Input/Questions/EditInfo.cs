using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api.Input.Questions
{
    public class EditInfo
    {
        [Required]
        public int ID{ get; set; }

        [Required(AllowEmptyStrings =false)]
        public string What { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string But { get; set; }
    }
}
