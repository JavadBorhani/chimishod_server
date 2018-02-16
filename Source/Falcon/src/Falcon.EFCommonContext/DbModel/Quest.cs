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
    
    public partial class Quest
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Quest()
        {
            this.Levels = new HashSet<Level>();
            this.Quest1 = new HashSet<Quest>();
            this.QuestQuestions = new HashSet<QuestQuestion>();
            this.QuestScores = new HashSet<QuestScore>();
        }
    
        public int QuestNumber { get; set; }
        public int QuestTypes { get; set; }
        public string QuestTitle { get; set; }
        public string QuestDescription { get; set; }
        public string QuestIcon { get; set; }
        public string QuestOffIcon { get; set; }
        public Nullable<int> ParentID { get; set; }
        public int Mean_Score { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdateDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Level> Levels { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Quest> Quest1 { get; set; }
        public virtual Quest Quest2 { get; set; }
        public virtual QuestType QuestType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestQuestion> QuestQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestScore> QuestScores { get; set; }
    }
}
