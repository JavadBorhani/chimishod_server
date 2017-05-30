using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SUserStat
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int? Score { get; set; }
        public int? Rank { get; set; }
        public int SpinRemainedChance { get; set; }
        public int SpinWheelCount { get; set; }
    }
}
