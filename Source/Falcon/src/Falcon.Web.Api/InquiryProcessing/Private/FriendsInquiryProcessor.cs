using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class FriendsInquiryProcessor : IFriendsInquiryProcessor
    {
        private readonly IFriendsQueryProcessor mFriendQuery;
        public FriendsInquiryProcessor(IFriendsQueryProcessor FriendQuery)
        {
            mFriendQuery = FriendQuery;
        }

        public async Task<int[]> GetAllFriendIds()
        {
            var friendIds = await mFriendQuery.GetAllFriendIds();
            return friendIds;   
        }

        public async Task<SFriend[]> GetAllFriendList()
        {
            var friends = await mFriendQuery.GetAllFriendList();
            return friends;
        }

        public async Task<bool> HasFriends(int[] FriendIds)
        {
            var exists = await mFriendQuery.HasFriends(FriendIds);
            return exists;
        }
    }
}