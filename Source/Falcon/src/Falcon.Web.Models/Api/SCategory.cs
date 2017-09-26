// Flapp Copyright 2017-2018

using System.Collections.Generic;
using System.Runtime.Serialization;

namespace Falcon.Web.Models.Api
{
    public class CategoryAnswerCount
    {
        public int CategoryID { get; set; }
        public int AnswerCount { get; set; }
    }

    [DataContract]
    public class SCategory
    {
        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string ShortDescription { get; set; }
        [DataMember]
        public string LongDescription { get; set; }
        [DataMember]
        public string Icon { get; set; }
        [DataMember]
        public int Price { get; set; }
        [DataMember]
        public bool IsActive { get; set; }
        [DataMember]
        public bool IsPurchased { get; set; }
        [DataMember]
        public int ScoreCoefficient { get; set; }
        [DataMember]
        public int DiscountAmount { get; set; }
        [DataMember]
        public int TagState { get; set; }
        [DataMember]
        public IEnumerable<int> CharacterIds { get; set; }
        
        public int Priority { get; set;}
    }
}
