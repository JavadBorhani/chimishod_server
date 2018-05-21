using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api.Quest
{
    [DataContract]
    public class SQuestDetail
    {
        [DataMember]
        public int QuestNumber { get; set; }
        [DataMember]
        public string QuestTitle { get; set; }
        [DataMember]
        public double PeopleScore { get; set; }
        [DataMember]
        public double UserScore { get; set; }

        private int? mUserScoreNullable;

        [IgnoreDataMember]
        public int? UserScoreNullable
        {
            get
            {
                return mUserScoreNullable;
            }
            set
            {
                mUserScoreNullable = value;
                UserScore = value ?? UserScore ;
            }
        }
    }
}
