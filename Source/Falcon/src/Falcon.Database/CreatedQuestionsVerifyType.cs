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
    
    public partial class CreatedQuestionsVerifyType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CreatedQuestionsVerifyType()
        {
            this.CreatedQuestions = new HashSet<CreatedQuestion>();
        }
    
        public int ID { get; set; }
        public string VerifyName { get; set; }
        public byte[] Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CreatedQuestion> CreatedQuestions { get; set; }
    }
}