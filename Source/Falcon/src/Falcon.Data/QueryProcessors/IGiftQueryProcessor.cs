using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IGiftQueryProcessor
    {
        Task<bool> Exists(int ID);
        Task<List<SGift>> TodayList();
        Task<Gift> GetByID(int ID);
        Task<bool> AddAchievedGift(int ID);
        Task<bool> IsAchieved(int ID);
        Task<List<int>> GetAchievedIdList();
    }
}
