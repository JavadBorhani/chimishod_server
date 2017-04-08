using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.Security
{
    public class PurchaseVerificationResponse
    {
        public int consumptionState { get; set; }
        public int purchaseState { get; set; }
        public int kind { get; set;}
        public int developerPayload { get; set; }
        public long purchaseTime { get; set; }
    }
}