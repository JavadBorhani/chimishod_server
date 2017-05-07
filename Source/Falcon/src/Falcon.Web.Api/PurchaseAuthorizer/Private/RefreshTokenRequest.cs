// Flapp Copyright 2017-2018
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.PurchaseAuthorizer.Private
{
    public class RefreshTokenRequest
    {
        public const string grant_type = "refresh_token";
        public string client_id { get; set; }
        public string client_secret { get; set; }
        public string refresh_token { get; set; }
    }
}