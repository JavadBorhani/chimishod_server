// Flapp Copyright 2017-2018
using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IUsersInquiryProcessor
    {
        Task<int> GetTotalCoin();
        Task<bool> LevelExist(int LevelNumber);
        //Task<SUserCount> GetUserCountInfo(int UserID);
      
        Task<SUser> GetUserInfo();
        Task<PagedDataInquiryResponse<SFriend>> SearchUsersByExpression(PagedDataRequest RequestInfo, string Expression);
    }
}