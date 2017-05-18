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
    
    public partial class AppTheme
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AppTheme()
        {
            this.PurchaseThemes = new HashSet<PurchaseTheme>();
            this.SelectedThemes = new HashSet<SelectedTheme>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public string ShortDesciption { get; set; }
        public string LongDescription { get; set; }
        public string SquareColor { get; set; }
        public string CircleColor { get; set; }
        public int Price { get; set; }
        public string BackImage { get; set; }
        public string DialogImage { get; set; }
        public int DiscountAmount { get; set; }
        public int TagStateID { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdatedDate { get; set; }
    
        public virtual TagState TagState { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseTheme> PurchaseThemes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SelectedTheme> SelectedThemes { get; set; }
    }
}
