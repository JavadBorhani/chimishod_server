using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.WatchAd.Private
{
    public class ErrorToken
    {
        public long timestamp { get; set; }
        public string error { get; set; }
        public string exception { get; set; }
        public string message { get; set; }
    }
}