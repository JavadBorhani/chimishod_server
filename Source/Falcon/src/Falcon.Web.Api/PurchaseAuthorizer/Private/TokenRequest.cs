using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.PurchaseAuthorizer.Private
{
    public class TokenRequest
    {
        public const string grant_type = "authorization_code";
        public string code { get; set; }
        public string client_id { get; set;}
        public string client_secret { get; set; }
        public string redirect_uri { get; set; }
    }
}