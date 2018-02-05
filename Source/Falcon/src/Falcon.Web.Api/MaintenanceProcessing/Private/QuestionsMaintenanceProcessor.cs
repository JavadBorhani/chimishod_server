using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class QuestionsMaintenanceProcessor : IQuestionsMaintenanceProcessor
    {
        private readonly IQuestionsQueryProcessor mQuestionQuery;
        private readonly IDateTime mDateTime;
        private readonly IFriendsInquiryProcessor mFriendInquiry;
        private readonly INotificationMaintenanceProcessor mNotificationManager;
        private readonly ISentMaintenanceProcessor mSentMaintenance;

        public QuestionsMaintenanceProcessor(
            IQuestionsQueryProcessor QuestionQuery , 
            IDateTime DateTime , 
            IFriendsInquiryProcessor FriendInquiry , 
            ISentMaintenanceProcessor SentMaintenance , 
            INotificationMaintenanceProcessor NotificationManager)
        {
            mFriendInquiry = FriendInquiry;
            mQuestionQuery = QuestionQuery;
            mDateTime = DateTime;
            mSentMaintenance = SentMaintenance;
            mNotificationManager = NotificationManager;
        }

        public async Task<int> CreateQuestion(SCreatedQuestion CreateQuestion)
        {
            //Send and Forwrad Question

            //check money before

            var totalCoin = await mQuestionQuery.CreateQuestion(CreateQuestion);

            var friendIdsExists = await mFriendInquiry.HasFriends(CreateQuestion.FriendForwardList);

            if(friendIdsExists)
            {

            }
            return 10;
        }

    }
}