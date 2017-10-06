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
    using System.Data.Entity.Core.Objects;
    using System.Data.Entity.Infrastructure;

    public partial class DbEntity : DbContext
    {
        public DbEntity()
            : base("name=DbEntity")
        {
        }

        public DbEntity(string NameOrConnectionString) : base(NameOrConnectionString)
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AchievedCodeGift> AchievedCodeGifts { get; set; }
        public virtual DbSet<AchievedGift> AchievedGifts { get; set; }
        public virtual DbSet<AchievedPosession> AchievedPosessions { get; set; }
        public virtual DbSet<AchievedScore> AchievedScores { get; set; }
        public virtual DbSet<AchievedSpinWheel> AchievedSpinWheels { get; set; }
        public virtual DbSet<Achievement> Achievements { get; set; }
        public virtual DbSet<AchievementQueryType> AchievementQueryTypes { get; set; }
        public virtual DbSet<AchieveStateType> AchieveStateTypes { get; set; }
        public virtual DbSet<Answer> Answers { get; set; }
        public virtual DbSet<AppAdvertisement> AppAdvertisements { get; set; }
        public virtual DbSet<ApplicationState> ApplicationStates { get; set; }
        public virtual DbSet<AppTheme> AppThemes { get; set; }
        public virtual DbSet<AssignedCharacter> AssignedCharacters { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<CharacterAlia> CharacterAlias { get; set; }
        public virtual DbSet<CharacterPoint> CharacterPoints { get; set; }
        public virtual DbSet<Character> Characters { get; set; }
        public virtual DbSet<CodeGift> CodeGifts { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<CreatedQuestion> CreatedQuestions { get; set; }
        public virtual DbSet<CreatedQuestionsRejectType> CreatedQuestionsRejectTypes { get; set; }
        public virtual DbSet<CreatedQuestionsVerifyType> CreatedQuestionsVerifyTypes { get; set; }
        public virtual DbSet<DailyReward> DailyRewards { get; set; }
        public virtual DbSet<DailyRewardsAchieved> DailyRewardsAchieveds { get; set; }
        public virtual DbSet<DisplayedNotification> DisplayedNotifications { get; set; }
        public virtual DbSet<Favorite> Favorites { get; set; }
        public virtual DbSet<Gift> Gifts { get; set; }
        public virtual DbSet<GiftType> GiftTypes { get; set; }
        public virtual DbSet<Level> Levels { get; set; }
        public virtual DbSet<Manufacture> Manufactures { get; set; }
        public virtual DbSet<MarketInfo> MarketInfoes { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<PersonalizedCharacter> PersonalizedCharacters { get; set; }
        public virtual DbSet<PresentedAdvert> PresentedAdverts { get; set; }
        public virtual DbSet<PriceHistory> PriceHistories { get; set; }
        public virtual DbSet<PurchaseAvatar> PurchaseAvatars { get; set; }
        public virtual DbSet<PurchaseCategory> PurchaseCategories { get; set; }
        public virtual DbSet<PurchaseTheme> PurchaseThemes { get; set; }
        public virtual DbSet<Question> Questions { get; set; }
        public virtual DbSet<QuestionAction> QuestionActions { get; set; }
        public virtual DbSet<QuestionBoost> QuestionBoosts { get; set; }
        public virtual DbSet<QuestionSelectorConfig> QuestionSelectorConfigs { get; set; }
        public virtual DbSet<ReportedQuestion> ReportedQuestions { get; set; }
        public virtual DbSet<ReportType> ReportTypes { get; set; }
        public virtual DbSet<ScoreType> ScoreTypes { get; set; }
        public virtual DbSet<SelectedAvatar> SelectedAvatars { get; set; }
        public virtual DbSet<SelectedCategory> SelectedCategories { get; set; }
        public virtual DbSet<SelectedTheme> SelectedThemes { get; set; }
        public virtual DbSet<SpinWheel> SpinWheels { get; set; }
        public virtual DbSet<SpinWheelType> SpinWheelTypes { get; set; }
        public virtual DbSet<Store> Stores { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TagState> TagStates { get; set; }
        public virtual DbSet<Tutorial> Tutorials { get; set; }
        public virtual DbSet<UnRepeatableAchievedSpinWheel> UnRepeatableAchievedSpinWheels { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserAvatar> UserAvatars { get; set; }
        public virtual DbSet<UserCount> UserCounts { get; set; }
        public virtual DbSet<UserInfo> UserInfoes { get; set; }
        public virtual DbSet<UserStat> UserStats { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }
        public virtual DbSet<WatchAdProvider> WatchAdProviders { get; set; }
        public virtual DbSet<WatchedAd> WatchedAds { get; set; }
        public virtual DbSet<AchievementStatistic> AchievementStatistics { get; set; }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual int UpdateCharacterRank()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UpdateCharacterRank");
        }
    
        public virtual int UpdateUserGlobalRank()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UpdateUserGlobalRank");
        }
    }
}
