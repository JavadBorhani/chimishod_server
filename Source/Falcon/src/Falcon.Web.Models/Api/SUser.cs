﻿// BMS-Studio Copyright 2017-2018
using System;

namespace Falcon.Web.Models.Api
{
    public class SUser
    {
        public int ID { get; set; }
        public string UUID { get; set; }
        public string UserName { get; set; }
        public Nullable<int> UserTypeID { get; set; }
        public int TotalStars { get; set; }
        public System.DateTime LastSceneDateTime { get; set; }
        public int LevelAnsweredNumber { get; set; }
        public int CurrentLevelID { get; set; }
        public bool IsAbleToWriteComment { get; set; }
    }
}
