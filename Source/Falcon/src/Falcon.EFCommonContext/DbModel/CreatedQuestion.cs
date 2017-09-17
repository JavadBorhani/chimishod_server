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
    
    public partial class CreatedQuestion
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public string What_if { get; set; }
        public string But { get; set; }
        public System.DateTime RegisterDateTime { get; set; }
        public int VerifyStateID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public Nullable<int> QuestionBoostID { get; set; }
        public bool Lock { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual CreatedQuestionsVerifyType CreatedQuestionsVerifyType { get; set; }
        public virtual QuestionBoost QuestionBoost { get; set; }
        public virtual User User { get; set; }
    }
}
