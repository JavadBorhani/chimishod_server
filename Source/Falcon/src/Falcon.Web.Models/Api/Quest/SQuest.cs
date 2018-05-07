using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api.Quest
{
    public enum QuestTypes
    {
        Sub = 1 ,
        Main = 2 ,
        Finale =3 
    }
    public enum QuestState
    {
        NotPurchased = 0,
        InProgress = 1,
        Done = 2
    }

    [DataContract]
    public class SQuest
    {
        [DataMember]
        public int QuestNumber { get; set; }
        [DataMember]
        public QuestTypes QuestTypes { get; set; }
        [DataMember]
        public string QuestTitle { get; set; }
        [DataMember]
        public string QuestDescription { get; set; }
        [DataMember]
        public string QuestWhiteIcon { get; set; }
        [DataMember]
        public string QuestColoredIcon { get; set; }
        [DataMember]
        public string QuestOffIcon { get; set; }

        [IgnoreDataMember]
        public int? ParentID { get; set; }
        [DataMember]
        public List<int> ChildQuestNumbers { get; set; }
        [DataMember]
        public int Price { get; set; }
        [DataMember]
        public int NumberOfQuestionsInQuest { get; set; }
        [DataMember]
        public int? BarretTypeID { get; set;}
    }
}
