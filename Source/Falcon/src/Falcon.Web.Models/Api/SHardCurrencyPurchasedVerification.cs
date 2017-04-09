using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SHardCurrencyPurchasedVerification
    {
        public int TotalCoin { get; set; }
        public string Error { get; set; }
        public string ErrorDescription { get; set; }
        public bool Authorized { get; set; }
    }
}
