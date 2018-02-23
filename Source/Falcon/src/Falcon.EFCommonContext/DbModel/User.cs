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
    
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            this.AchievedCodeGifts = new HashSet<AchievedCodeGift>();
            this.Answers = new HashSet<Answer>();
            this.Feedbacks = new HashSet<Feedback>();
            this.Orders = new HashSet<Order>();
            this.Questions = new HashSet<Question>();
            this.QuestScores = new HashSet<QuestScore>();
            this.Relationships = new HashSet<Relationship>();
            this.Relationships1 = new HashSet<Relationship>();
            this.Relationships2 = new HashSet<Relationship>();
            this.ReportedQuestions = new HashSet<ReportedQuestion>();
            this.Sents = new HashSet<Sent>();
            this.SentGroups = new HashSet<SentGroup>();
            this.SentGroups1 = new HashSet<SentGroup>();
            this.UserInfoes = new HashSet<UserInfo>();
            this.UserQuestAnswers = new HashSet<UserQuestAnswer>();
            this.WatchedAds = new HashSet<WatchedAd>();
        }
    
        public int ID { get; set; }
        public string UserName { get; set; }
        public Nullable<int> UserTypeID { get; set; }
        public int LevelProgress { get; set; }
        public int LevelNumber { get; set; }
        public int TotalCoin { get; set; }
        public bool IsMale { get; set; }
        public string UUID { get; set; }
        public string NotificationID { get; set; }
        public int Platform { get; set; }
        public string APILevel { get; set; }
        public string Device { get; set; }
        public string Model { get; set; }
        public byte[] RowVersion { get; set; }
        public string IPAddress { get; set; }
        public string AvatarImagePath { get; set; }
        public bool Activated { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AchievedCodeGift> AchievedCodeGifts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Answer> Answers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual Level Level { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
        public virtual PlatformType PlatformType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Question> Questions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<QuestScore> QuestScores { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Relationship> Relationships { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Relationship> Relationships1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Relationship> Relationships2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReportedQuestion> ReportedQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sent> Sents { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SentGroup> SentGroups { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SentGroup> SentGroups1 { get; set; }
        public virtual UserType UserType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserInfo> UserInfoes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserQuestAnswer> UserQuestAnswers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WatchedAd> WatchedAds { get; set; }
    }
}
