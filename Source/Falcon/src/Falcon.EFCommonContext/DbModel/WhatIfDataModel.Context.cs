﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DbEntity : DbContext
    {
        public DbEntity()
            : base("name=DbEntity")
        {

        }
        public DbEntity(string NameOrConnectionString)
            : base(NameOrConnectionString)
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AchievedGift> AchievedGifts { get; set; }
        public virtual DbSet<AchievedPosession> AchievedPosessions { get; set; }
        public virtual DbSet<Achievement> Achievements { get; set; }
        public virtual DbSet<AchievementQueryType> AchievementQueryTypes { get; set; }
        public virtual DbSet<AchieveStateType> AchieveStateTypes { get; set; }
        public virtual DbSet<Answer> Answers { get; set; }
        public virtual DbSet<ApplicationState> ApplicationStates { get; set; }
        public virtual DbSet<AppTheme> AppThemes { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<CreatedQuestion> CreatedQuestions { get; set; }
        public virtual DbSet<CreatedQuestionsVerifyType> CreatedQuestionsVerifyTypes { get; set; }
        public virtual DbSet<Favorite> Favorites { get; set; }
        public virtual DbSet<Gift> Gifts { get; set; }
        public virtual DbSet<Level> Levels { get; set; }
        public virtual DbSet<Manufacture> Manufactures { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OurAdvertisement> OurAdvertisements { get; set; }
        public virtual DbSet<PurchaseCategory> PurchaseCategories { get; set; }
        public virtual DbSet<PurchaseTheme> PurchaseThemes { get; set; }
        public virtual DbSet<Question> Questions { get; set; }
        public virtual DbSet<QuestionBoost> QuestionBoosts { get; set; }
        public virtual DbSet<ReportedQuestion> ReportedQuestions { get; set; }
        public virtual DbSet<ReportType> ReportTypes { get; set; }
        public virtual DbSet<SelectedCategory> SelectedCategories { get; set; }
        public virtual DbSet<SelectedTheme> SelectedThemes { get; set; }
        public virtual DbSet<Store> Stores { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserInfo> UserInfoes { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }
    }
}
