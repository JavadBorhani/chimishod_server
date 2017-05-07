// Flapp Copyright 2017-2018
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.PurchaseAuthorizer.Private
{
    public class PurchaseVerificationError : PurchaseVerificationResponse
    {
        public string error_code
        {
            get
            {
                return error;
            }
            set
            {
                error = value;
            }
        }
        public string error { get; set; }
        public string error_description { get; set; }
    }
}