using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api.Quest
{
    public enum QuestTypes
    {
        Sub,
        Main,
        Finale
    }
    [DataContract]
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
        [IgnoreDataMember]
        public int? ParentID { get; set; }
        [IgnoreDataMember]
        public int LevelNumber { get; set; }
        public List<int> ChildQuestNumbers { get; set; }
    }
}
