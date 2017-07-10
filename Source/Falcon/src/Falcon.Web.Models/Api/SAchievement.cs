// Flapp Copyright 2017-2018

using System.Collections.Generic;

namespace Falcon.Web.Models.Api
{
    public class AchievementList : Dictionary<string , List<SAchievement>> { }


    public enum AchievementStyle
    {
        Answer = 1 , 
        Score = 2 , 
        Level = 3 , 
        Avatar = 4 , 
        Category = 5 
    }

    public enum AchievementState : int
    {
        AchievementDefaultNotAchievedID = 1,
        AchievementDefaultAchievableID = 2,
        AchievementDefaultAchievedID = 3
    }
    public class SAchievement
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Star { get; set; }
        public string Icon { get; set; }
        public int Prize { get; set; }
        public string RectangleColor { get; set; }
        public AchievementState AchievementState { get; set; }
    }

}
