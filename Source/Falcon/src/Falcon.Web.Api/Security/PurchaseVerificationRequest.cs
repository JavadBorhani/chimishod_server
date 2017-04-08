using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.Security
{
    public class PurchaseVerificationRequest
    {
        public string VerificationLink { get; set; }
        public string AppPackageName { get; set; }
        public string ProductID { get; set; }
        public string Token { get; set; }
    }
}