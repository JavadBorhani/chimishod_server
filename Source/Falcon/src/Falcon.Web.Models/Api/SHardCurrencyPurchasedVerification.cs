using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SHardCurrencyPurchasedVerification
    {
        public enum ErrorCodeType
        {
            None,
            TokenExpired,
            Other
        }
        public int StoreItemId { get; set; }
        public int TotalCoin { get; set; }
        public ErrorCodeType ErrorCode { get; set; }        
        public bool IsValid { get; set; }
    }
}
