// Flapp Copyright 2017-2018

using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Quest;

namespace Falcon.Web.Models.Api
{
    public enum UserTypes
    {
        None = -1,
        Admin = 1,  
        Local = 2
    };

    public class SUser
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public int LevelProgress { get; set; }
        public int LevelNumber { get; set; }
        public int QuestNumber { get; set; }
        public QuestState QuestState { get; set; }
        public int TotalCoin { get; set; }
        public string UUID { get; set; }
        public string AvatarImagePath { get; set; }
        public SLevel CurrentLevel { get; set; }
        public bool GenderIsMale { get; set; }
    }
}
