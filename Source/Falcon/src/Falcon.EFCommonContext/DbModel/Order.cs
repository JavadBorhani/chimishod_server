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
    
    public partial class Order
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int StoreID { get; set; }
        public System.DateTime PurchasedDate { get; set; }
        public string PurchasedToken { get; set; }
        public int PurchaseState { get; set; }
        public int ConsumptionState { get; set; }
    
        public virtual Store Store { get; set; }
        public virtual User User { get; set; }
    }
}
