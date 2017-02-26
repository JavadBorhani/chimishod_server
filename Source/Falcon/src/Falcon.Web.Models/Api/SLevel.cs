using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SLevel
    {
        public int? ID { get; set; }
        public int LevelNumber { get; set; }
        public int Coin { get; set; }
        public int Ceil { get; set; }
    }
}
