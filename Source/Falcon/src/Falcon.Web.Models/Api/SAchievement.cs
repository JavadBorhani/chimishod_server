// Flapp Copyright 2017-2018

using System.Collections.Generic;

namespace Falcon.Web.Models.Api
{
    public class SAchievementDic : Dictionary<string , List<SAchievement>> { }
    public class SAchievementPossesion { public int AchievementID { get; set; } public AchievementState AchievementState { get; set; } }

    public enum AchievementStyle
    {
        Answer = 1 , 
        Score = 2 , 
        Level = 3 , 
        Avatar = 4 , 
        Category = 5 ,
        CreatedQuestions = 6
    }

    public enum AchievementState : int
    {
        AchievementDefaultNotAchievedID = 1,
        AchievementDefaultAchievableID = 2,
        AchievementDefaultAchievedID = 3,
        NotSpecified = 4,
    }
    public class SAchievement
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Star { get; set; }
        public string Icon { get; set; }
        public int Prize { get; set; }
        public AchievementState AchievementState { get; set; }
    }

    public class UserAchievementRecord
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? QueryTypeID { get; set; }
        public int? CategoryID { get; set; }
        public int? Quantity { get; set; }
        public int Coin { get; set; }
        public int ScorePrize { get; set; }
        public string Icon { get; set; }
        public bool IsActive { get; set; }
        public int Priority { get; set; }
        public AchievementState AchievementState { get; set; }
    }

}
