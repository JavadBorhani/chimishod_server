// Flapp Copyright 2017-2018
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.PurchaseAuthorizer.Private
{
    public class PurchaseVerificationRequest
    {
        public string AccessToken { get; set; }
        public string VerificationLink { get; set; }
        public string AppPackageName { get; set; }
        public string ProductID { get; set; }
        public string Token { get; set; }
    }
}