using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public enum WatchAdProvider
    {
        TapSell = 1
    };

    public class SWatchAdValidation
    {
        [Required]
        public WatchAdProvider ProviderID { get; set;}

        [Required(AllowEmptyStrings =false)]
        public string WatchAdId { get; set; }
    }
}
