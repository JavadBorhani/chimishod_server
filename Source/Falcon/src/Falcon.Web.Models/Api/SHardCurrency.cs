using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;    

namespace Falcon.Web.Models.Api
{
    public class SHardCurrency
    {
        [Required]
        public int StoreItemID { get; set; }
        [Required(AllowEmptyStrings = false , ErrorMessage = "PurchaseToken can not be null")]
        public string PurchasedToken { get; set;}
    }
}
