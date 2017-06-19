using Falcon.Data;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IUserStatsInquiryProcessor
    {
        Task<SUserStat> GetStatusByID(int ID);
        Task<SGlobalRankLeaderBoard> GetLeaderBoard(PagedDataRequest RequestInfo);
    }
}
