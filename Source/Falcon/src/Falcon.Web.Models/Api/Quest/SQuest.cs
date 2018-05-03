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

        [IgnoreDataMember]
        public int? ParentID { get; set; }
        public List<int> ChildQuestNumbers { get; set; }
        public int Price { get; set; }
        public int NumberOfQuestionsInQuest { get; set; }
        public int? BarretTypeID { get; set;}
    }
}
