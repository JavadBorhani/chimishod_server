using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SCodeGift
    {
        public int ID { get; set; }
        public string CompanyName { get; set; }
        public string Serial { get; set; }
        public int Prize { get; set; }
        public int UserCount { get; set; }
        public int StartDate { get; set; }
        public int ExpireDate { get; set; }
    }
}
