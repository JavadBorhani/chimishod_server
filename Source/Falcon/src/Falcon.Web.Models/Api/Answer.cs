using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{    
    public class Answer
    {
        public int ID { get; set; }

        public int UserID { get; set; }

        [Required(AllowEmptyStrings = false)]
        public int QuestionID { get; set; }

        public Nullable<bool> Liked { get; set; }

        public Nullable<bool> Dislike { get; set; }

        [Required]
        public bool YesNoState { get; set; }

        public bool IsFavorited { get; set; }

        public System.DateTime CreatedDate { get; set; }
    }
}
