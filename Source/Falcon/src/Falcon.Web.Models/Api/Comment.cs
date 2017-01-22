using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class Comment
    {
        
        public int UserID { get; set; }

        public string UserName { get; set; }

        public int QuestionID { get; set; }

        [Required]
        public string Content { get; set; }

        public string Response { get; set; }

        public DateTime InsertDate { get; set; }

    }
}
