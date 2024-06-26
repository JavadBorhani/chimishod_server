﻿using Falcon.Web.Models.Api;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IGiftQueryProcessor
    {
        Task<bool> Exists(int ID);
        Task<List<SGift>> TodayGiftList();
        //Task<Gift> GetByID(int ID);
        Task<bool> AddAchievedGift(int ID);
        Task<bool> IsAchieved(int ID);
        Task<List<int>> GetAchievedIdList();
        Task<bool> CheckGiftLogic(SGift CurrentGift);
        //Task<bool> CheckGiftLogic(SGift CurrentGift, Gift Gift, DateTime DateTime);
    }
}
