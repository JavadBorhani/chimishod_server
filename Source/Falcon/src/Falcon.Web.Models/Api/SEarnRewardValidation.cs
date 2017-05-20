using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SEarnRewardValidation
    {
        public bool IsValid { get; set;}
        public int  TotalCoin { get; set;}
        public int  RequestID { get; set; }
    }
}
