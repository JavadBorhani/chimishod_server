//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Falcon.EFCommonContext.DbModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class QuestQuestion
    {
        public int ID { get; set; }
        public int QuestionID { get; set; }
        public int YesQuestNumber { get; set; }
        public int NoQuestNumber { get; set; }
        public int YesScore { get; set; }
        public int NoScore { get; set; }
        public int QuestNumber { get; set; }
    
        public virtual Quest Quest { get; set; }
        public virtual Question Question { get; set; }
    }
}
