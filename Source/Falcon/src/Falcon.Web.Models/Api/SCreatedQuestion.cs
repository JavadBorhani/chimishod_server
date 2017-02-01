// BMS-Studio Copyright 2017-2018

using System.ComponentModel.DataAnnotations;

namespace Falcon.Web.Models.Api
{
    public class SCreatedQuestion
    {
        [Required(AllowEmptyStrings = false)]
        public string What { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string But { get; set; }

        public int? BoostID { get; set; }
    }
}
