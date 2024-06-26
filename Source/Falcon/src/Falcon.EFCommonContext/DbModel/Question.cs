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
    
    public partial class Question
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Question()
        {
            this.Answers = new HashSet<Answer>();
            this.QuestionNotifications = new HashSet<QuestionNotification>();
            this.QuestQuestions = new HashSet<QuestQuestion>();
            this.QuestQuestionsAnswers = new HashSet<QuestQuestionsAnswer>();
            this.ReportedQuestions = new HashSet<ReportedQuestion>();
            this.Sents = new HashSet<Sent>();
            this.Tutorials = new HashSet<Tutorial>();
        }
    
        public int ID { get; set; }
        public string What_if { get; set; }
        public string But { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> HashTagID { get; set; }
        public int Yes_Count { get; set; }
        public int No_Count { get; set; }
        public int Like_Count { get; set; }
        public int Dislike_Count { get; set; }
        public Nullable<int> ActionID { get; set; }
        public double Weight { get; set; }
        public int CommentCount { get; set; }
        public int ReportCount { get; set; }
        public bool Active { get; set; }
        public bool RemovedByCreator { get; set; }
        public bool IsPublic { get; set; }
        public bool IsOurAuthor { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdateDate { get; set; }
        public int AnswerCount { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Answer> Answers { get; set; }
        public virtual HashTag HashTag { get; set; }
        public virtual QuestionAction QuestionAction { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestionNotification> QuestionNotifications { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestQuestion> QuestQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestQuestionsAnswer> QuestQuestionsAnswers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReportedQuestion> ReportedQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sent> Sents { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tutorial> Tutorials { get; set; }
    }
}
