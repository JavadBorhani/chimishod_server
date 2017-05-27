using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public enum SSpinWheelType
    {
        Category = 1 , 
        Theme = 2 ,
        Avatar = 3 , 
        Coin = 4  ,
        Blank = 5  , 
        Fortune = 6,
    }
    
    public class SSpinWheel
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Icon { get; set; }
        public SSpinWheelType SpinWheelType { get; set; }
        public int Prize { get; set; }
        public int? SpinWheelAlternativeID { get; set; }
        public int FirstChance { get; set; }
        public int SecondChance { get; set; }
        public int Priority { get; set; }
    }
}
