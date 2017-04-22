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
            this.AchievedGifts = new HashSet<AchievedGift>();
            this.AchievedPosessions = new HashSet<AchievedPosession>();
            this.Answers = new HashSet<Answer>();
            this.Comments = new HashSet<Comment>();
            this.CreatedQuestions = new HashSet<CreatedQuestion>();
            this.DisplayedNotifications = new HashSet<DisplayedNotification>();
            this.Favorites = new HashSet<Favorite>();
            this.Manufactures = new HashSet<Manufacture>();
            this.Orders = new HashSet<Order>();
            this.PurchaseAvatars = new HashSet<PurchaseAvatar>();
            this.PurchaseCategories = new HashSet<PurchaseCategory>();
            this.PurchaseThemes = new HashSet<PurchaseTheme>();
            this.ReportedQuestions = new HashSet<ReportedQuestion>();
            this.SelectedAvatars = new HashSet<SelectedAvatar>();
            this.SelectedCategories = new HashSet<SelectedCategory>();
            this.SelectedThemes = new HashSet<SelectedTheme>();
            this.UserInfoes = new HashSet<UserInfo>();
        }
    
        public int ID { get; set; }
        public string UUID { get; set; }
        public string UserName { get; set; }
        public Nullable<int> UserTypeID { get; set; }
        public int TotalStars { get; set; }
        public int Score { get; set; }
        public int LevelProgress { get; set; }
        public Nullable<int> CurrentLevelID { get; set; }
        public bool IsAbleToWriteComment { get; set; }
        public System.DateTime LastSeenDateTime { get; set; }
        public System.DateTime PrevLastSeenDateTime { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AchievedCodeGift> AchievedCodeGifts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AchievedGift> AchievedGifts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AchievedPosession> AchievedPosessions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Answer> Answers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CreatedQuestion> CreatedQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DisplayedNotification> DisplayedNotifications { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Favorite> Favorites { get; set; }
        public virtual Level Level { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Manufacture> Manufactures { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseAvatar> PurchaseAvatars { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseCategory> PurchaseCategories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseTheme> PurchaseThemes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReportedQuestion> ReportedQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SelectedAvatar> SelectedAvatars { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SelectedCategory> SelectedCategories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SelectedTheme> SelectedThemes { get; set; }
        public virtual UserType UserType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserInfo> UserInfoes { get; set; }
    }
}
