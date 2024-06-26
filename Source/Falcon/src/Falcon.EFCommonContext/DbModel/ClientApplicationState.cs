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
    
    public partial class ClientApplicationState
    {
        public int ID { get; set; }
        public int ClientVersionInfo { get; set; }
        public bool IsMajorVersion { get; set; }
        public int CreateQuestionPrice { get; set; }
        public int WatchAdCoin { get; set; }
        public int LevelVersionCode { get; set; }
        public int XPLevelFactor { get; set; }
        public int PollingIntervalTimeInSeconds { get; set; }
        public int ForwardPricePerFriend { get; set; }
        public int QuestVersionCode { get; set; }
        public int XPQuestFactor { get; set; }
        public int ActiveAdsProvider { get; set; }
    
        public virtual WatchAdProvider WatchAdProvider { get; set; }
    }
}
