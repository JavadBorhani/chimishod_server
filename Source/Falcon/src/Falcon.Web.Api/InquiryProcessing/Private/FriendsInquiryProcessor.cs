using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api.Friend;
using System;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class FriendsInquiryProcessor : IFriendsInquiryProcessor
    {
        private readonly IFriendsQueryProcessor mFriendQuery;
        public FriendsInquiryProcessor()
        {

        }
        public async Task<SFriend[]> GetFriendList()
        {
            throw new NotImplementedException();
        }
    }
}