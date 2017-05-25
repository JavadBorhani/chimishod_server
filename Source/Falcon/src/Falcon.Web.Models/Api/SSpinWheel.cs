using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public class SSpinWheel
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Icon { get; set; }
        public int SpinWheelTypeID { get; set; }
        public int Prize { get; set; }
        public int SpinWheelAlternativeID { get; set; }
        public int FirstChance { get; set; }
        public int SecondChance { get; set; }
    }
}
