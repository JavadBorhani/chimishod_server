// Flapp Copyright 2017-2018

using System;
using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{    
    public class SAnswer
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

        public DateTime CreatedDate { get; set; }

        public bool SendQuestion { get; set; }

        public int CategoryToGetQuestion { get; set; }
    }
}
