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
    
    public partial class UserQuestAnswer
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int QuestNumber { get; set; }
        public int Point { get; set; }
    
        public virtual Quest Quest { get; set; }
        public virtual User User { get; set; }
    }
}
