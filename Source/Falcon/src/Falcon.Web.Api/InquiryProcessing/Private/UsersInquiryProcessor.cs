using AutoMapper;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class UsersInquiryProcessor : IUsersInquiryProcessor
    {
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;

        public UsersInquiryProcessor(IUserQueryProcessor UserQueryProcessor , IMapper Mapper ,  IWebUserSession UserSession)
        {
            mUserSession = UserSession;
            mUserQueryProcessor = UserQueryProcessor;
            mMapper = Mapper;
        }
        public async Task<int> GetTotalCoin()
        {
            int totalCoin = await mUserQueryProcessor.GetTotalCoin();
            return totalCoin;
        }

        //public async Task<SUserCount> GetUserCountInfo(int UserID)
        //{
        //    var data = await mUserQueryProcessor.GetUserCountInfo(UserID);
        //    var result = mMapper.Map<SUserCount>(data);

        //    return data;    

        //}

        public async Task<bool> LevelExist(int LevelNumber)
        {
            bool exists = await mUserQueryProcessor.LevelExits(LevelNumber);
            return exists;   
        }

        public async Task<string> RecoverUser(SUserInfo UserInfo)
        {
            var uuid = await mUserQueryProcessor.ReteriveUserUUID(UserInfo);

            if(uuid != null)
            {
                var result = await mUserQueryProcessor.UpdateUserNotificationID(UserInfo.NotificationID.ToString());
                return uuid;
            }
            else
            {
                return null;
            }
        }

        public async Task<SUser> GetUserInfo()
        {
            var userdata = await mUserQueryProcessor.LoadUser(mUserSession.ID);

            var user = mMapper.Map<SUser>(userdata);

            return user;    
        }
    }
}