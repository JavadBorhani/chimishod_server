using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api
{
    public enum GiftTypes
    {
        Daily,
        DateTime, 
        Message, 
    };

    public class SGift
    {
        public int ID { get; set; }
        public string Image { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Priority { get; set; }
        public int Prize { get; set; }
        public int? Day { get; set; }
        public DateTime? ExpireDate { get; set; }

        [IgnoreDataMember]
        public GiftTypes GiftType { get; set; }
        [IgnoreDataMember]
        public string GiftTypeString { get; set; }
    }
}
