using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.Security
{
    public class PurchaseVerificationSuccessful : PurchaseVerificationResponse
    {
        public int consumptionState { get; set; }
        public int purchaseState { get; set; }
        public string kind { get; set;}
        public string developerPayload { get; set; }
        public long purchaseTime { get; set; }
        public long purchaseTimeMillis
        {
            get
            {
                return purchaseTime;
            }
            set
            {
                purchaseTime = value;
            }

        }
    }
}