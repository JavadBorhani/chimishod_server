using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Models.Api
{
    public enum DailyRewardState
    {
        Collected = 1 ,
        Collectible = 2 ,
        NotCollectible = 3,
    }
    public class SDailyReward
    {
        
        public int ID { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
        public int Day { get; set; }
        public int Prize { get; set; }
        public DailyRewardState State { get; set; }

    }
}
