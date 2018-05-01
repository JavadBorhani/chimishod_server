using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api.Quest
{
    public class FinaleDescription
    {
        public string Title { get; set; }
        public string Description { get; set;}
    }

    [DataContract]
    public class SFinaleQuest
    {
        [IgnoreDataMember]
        public int ID { get; set; }

        [DataMember]
        public int Title { get; set; }

        [DataMember]
        public FinaleDescription[] Description { get; set;}
    }
}
