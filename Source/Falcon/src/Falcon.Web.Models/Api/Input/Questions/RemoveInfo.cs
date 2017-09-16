using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api.Input.Questions
{
    public class RemoveInfo
    {
        [Required]
        public int ID { get; set; }
        [Required]
        public CreatedQuestionState State { get; set; }
    }
}
