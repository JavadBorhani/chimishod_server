using AutoMapper;
using Falcon.Common.Security;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PagedTaskDataInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.Friend.SFriend>;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class UsersInquiryProcessor : IUsersInquiryProcessor
    {
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;
        private readonly IFriendsInquiryProcessor mFriendsInquiry;


        public UsersInquiryProcessor(IUserQueryProcessor UserQueryProcessor , IMapper Mapper ,  IWebUserSession UserSession , IFriendsInquiryProcessor FriendsInquiry)
        {
            mUserSession = UserSession;
            mUserQueryProcessor = UserQueryProcessor;
            mMapper = Mapper;
            mFriendsInquiry = FriendsInquiry;
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
            var user = await mUserQueryProcessor.ReteriveUserByUserPass(UserInfo);

            if(user != null)
            {
                var result = await mUserQueryProcessor.UpdateUserNotificationID(user.ID,UserInfo.NotificationID.ToString());
                return user.UUID;
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

        public async Task<PagedDataInquiryResponse<SFriend>> SearchUsersByExpression(PagedDataRequest RequestInfo, string Expression)
        {


            var friendIds = await mFriendsInquiry.GetAllFriendIds();

            var queryResult = await mUserQueryProcessor.SearchUserNames(RequestInfo, Expression , friendIds);

            var searches = queryResult.QueriedItems.ToList();

            var items = mMapper.Map<List<SFriend>>(searches);

            var inquiryResponse = new PagedTaskDataInquiryResponse
            {
                Items = items,
                PageCount = queryResult.TotalPageCount,
                PageNumber = RequestInfo.PageNumber,
                PageSize = RequestInfo.PageSize
            };

            return inquiryResponse;
            
        }
    }
}