//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Falcon.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comment
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int QuestionID { get; set; }
        public string Comment1 { get; set; }
        public string Answer { get; set; }
        public bool IsVerified { get; set; }
        public System.DateTime InsertDate { get; set; }
    
        public virtual Question Question { get; set; }
        public virtual User User { get; set; }
    }
}
