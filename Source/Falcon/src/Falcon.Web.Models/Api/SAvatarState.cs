using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SAvatarState
    {
        public int TotalStar { get; set; }
        public int ID { get; set; }
        public string PicUrl { get; set; }
        public bool Purchased {get ;set ;}
        public int RequestID { get; set; }
    }
}
