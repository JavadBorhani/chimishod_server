using System;

namespace Falcon.Web.Models.Api.Config
{
    public class SClientAppState
    {
        public int ClientVersion { get; set;}
        public bool IsMajorChange { get; set;}
        public int CreateQuestionPrice { get; set; }
        public int WatchAdCoin { get; set; }
        public int LevelVersionCode { get; set; }
        public int QuestVersionCode { get; set; }
        public int XPLevelFactor { get; set; }
        public int PollingIntervalTimeInSeconds { get; set; }
        public DateTime ServerTime { get; set; }
        public int ForwardPricePerFriend { get; set; }
    }
}
