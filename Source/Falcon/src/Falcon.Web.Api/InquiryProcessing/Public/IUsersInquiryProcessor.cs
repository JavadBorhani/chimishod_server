// Flapp Copyright 2017-2018
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IUsersInquiryProcessor
    {
        Task<int> GetTotalCoin();
        Task<bool> LevelExist(int LevelNumber);
        //Task<SUserCount> GetUserCountInfo(int UserID);
    }
}