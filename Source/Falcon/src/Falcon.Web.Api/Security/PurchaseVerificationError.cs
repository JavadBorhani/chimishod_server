﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.Security
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