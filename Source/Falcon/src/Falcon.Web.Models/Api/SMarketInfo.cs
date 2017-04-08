using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SMarketInfo
    {
        public int ID { get; set; }
        public string MarketName { get; set; }
        public string Code { get; set; }

        public string AppPackageName { get; set; }
        public string PaymentVerificationLink { get; set; }
        public string LinkToAuthorize { get; set; }
        public string ClientID { get; set; }
        public string ClientSecret { get; set; }
        public string AccessToken { get; set; }
        public string RefreshToken { get; set; }
        public string RedirectURI { get; set; }
        public DateTime? ExpireAt { get; set; }
        public bool NeedsTokenVerification { get; set; }
    }
}
