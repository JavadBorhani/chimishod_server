using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api.Polling;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class PollingInquiryProcessor : IPollingInquiryProcessor
    {
        
        private readonly ISentInquiryProcessor mSentInquiry;
        private readonly IFriendsInquiryProcessor mFriendInquiry;

        public PollingInquiryProcessor(ISentInquiryProcessor SentInquiry , IFriendsInquiryProcessor FriendInquiry)
        {
            mSentInquiry = SentInquiry;
            mFriendInquiry = FriendInquiry;
        }

        public async Task<SClientPollingData> PollingMainRequests(SPollingInquiry PollingInquiry)
        {
            
            var inbox = await mSentInquiry.GetUserInboxFromDateUpToNow(PollingInquiry.InboxQuestionsDate);

            var friends = await mFriendInquiry.GetFriendListFromDateUpToNow(PollingInquiry.FriendRequestDate , PollingInquiry.FriendResponseDate);

            var response = new SClientPollingData
            {
                InboxQuestions = inbox,
                FriendRequests = friends?.FriendRequst,
                FriendResponses = friends?.FriendResponse
            };

            return response;
        }
    }
}