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
    
    public partial class Tutorial
    {
        public int ID { get; set; }
        public int QuestionID { get; set; }
        public int Priority { get; set; }
    
        public virtual Question Question { get; set; }
    }
}
