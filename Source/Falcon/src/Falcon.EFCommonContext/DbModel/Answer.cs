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
    
    public partial class Answer
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int CategoryID { get; set; }
        public int QuestionID { get; set; }
        public Nullable<bool> Liked { get; set; }
        public Nullable<bool> Dislike { get; set; }
        public bool YesNoState { get; set; }
        public System.DateTime CreatedDate { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Question Question { get; set; }
        public virtual User User { get; set; }
    }
}
