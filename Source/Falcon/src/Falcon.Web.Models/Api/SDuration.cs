using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Models.Api
{
    public class SDuration
    {
        public SDuration(DateTime FromDate, DateTime ToDate)
        {
            From = FromDate;
            To = ToDate;    
        }
        public DateTime From { get; set; }
        public DateTime To { get; set; }
    }
}