// Flapp Copyright 2017-2018
using System;

namespace Falcon.Web.Models.Api
{
    public class SUser
    {
        public int ID { get; set; }
        public string UserName { get; set; }
        public int? UserTypeID { get; set; }
        public int TotalCoin { get; set; }
        public int Score { get; set; }
        public bool IsAbleToWriteComment { get; set; }
        public int LevelProgress { get; set; }
        public int RemainedSpinChance { get; set; }
        public int TotalSpinCount { get; set; }
    }
}
