// Flapp Copyright 2017-2018
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.PurchaseAuthorizer.Private
{
    public class TokenResponse
    {
        public string access_token { get; set; }
        public string token_type { get; set; }
        public long expires_in { get; set; }
        public string refresh_token { get; set;}
        public string scope { get; set; }
    }
}