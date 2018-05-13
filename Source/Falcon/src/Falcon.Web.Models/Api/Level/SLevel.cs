using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api.Level
{
    [DataContract]
    public class SLevel
    {
        [DataMember]
        public int LevelNumber { get; set; }
        [DataMember]
        public int CoinPrize { get; set; }
        [DataMember]
        public int ScoreCeil { get; set; }
        [IgnoreDataMember]
        public int LevelWatchVideoMultiplier { get; set; }
    }
}
