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
    
    public partial class BarrettUserScore
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int BarrettID { get; set; }
        public double Score { get; set; }
    
        public virtual BarrettType BarrettType { get; set; }
        public virtual User User { get; set; }
    }
}
