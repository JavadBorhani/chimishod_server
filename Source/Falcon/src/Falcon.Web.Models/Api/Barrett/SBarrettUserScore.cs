using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api.Barrett
{
    [DataContract]
    public class SBarrettUserScore
    {
        [IgnoreDataMember]
        public int UserID { get; set; }

        [DataMember]
        public int BarrettID { get; set; }

        [DataMember]
        public string Title { get; set; }


        [DataMember]
        public double Score { get; set; }
    }
}
