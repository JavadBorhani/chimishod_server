using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Models.Api.Level
{
    public class SLevel
    {
        public int LevelNumber { get; set; }
        public int CoinPrize { get; set; }
        public int ScoreCeil { get; set; }
        public int QuestID { get; set; }
        public QuestTypes QuestType { get; set; }
        public string QuestTitle { get; set; }
    }
}
