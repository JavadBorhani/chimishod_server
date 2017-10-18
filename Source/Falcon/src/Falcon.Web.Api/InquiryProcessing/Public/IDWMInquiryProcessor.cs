using Falcon.Web.Models.Api;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IDWMInquiryProcessor
    {
        Task<List<SDailyReward>> GetDailyRewardList();
    }
}