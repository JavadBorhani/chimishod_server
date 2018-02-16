using System.Collections.Generic;

namespace Falcon.Web.Models.Api.Quest
{
    public enum QuestTypes
    {
        Sub,
        Main,
        Finale
    }
    public class SQuest
    {

        public int QuestNumber { get; set; }
        public QuestTypes QuestTypes { get; set; }
        public string QuestTitle { get; set; }
        public string QuestDescription { get; set; }
        public string QuestWhiteIcon { get; set; }
        public string QuestColoredIcon { get; set; }
        public string QuestOffIcon { get; set; }
        public int CoinPrize { get; set; }
        public int MeanScore { get; set; }
        public List<int> ChildQuestNumbers { get; set; }
    }
}
