using AutoMapper;
using Falcon.Common.Security;
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
        private readonly IUserSession mUserSession;
        private readonly IFriendsInquiryProcessor mFriendInquiry;
        private readonly INotificationMaintenanceProcessor mNotificationManager;
        private readonly ISentMaintenanceProcessor mSentMaintenance;
        private readonly IMapper mMapper;

        public QuestionsMaintenanceProcessor(
            IQuestionsQueryProcessor QuestionQuery , 
            IFriendsInquiryProcessor FriendInquiry , 
            ISentMaintenanceProcessor SentMaintenance , 
            INotificationMaintenanceProcessor NotificationManager,
            IUserSession UserSession,
            IMapper Mapper)
        {
            mFriendInquiry = FriendInquiry;
            mQuestionQuery = QuestionQuery;
            mSentMaintenance = SentMaintenance;
            mNotificationManager = NotificationManager;
            mUserSession = UserSession;
            mMapper = Mapper;
        }

        public async Task<int> CreateQuestion(SCreatedQuestion CreateQuestion)
        {
            //TODO : Checking Money 

            var friendIdsExists = await mFriendInquiry.HasFriends(CreateQuestion.FriendForwardList);

            if(friendIdsExists)
            {
                var createdQuestion = await mQuestionQuery.CreateQuestion(CreateQuestion);
                var stored = await mSentMaintenance.StoreMessageSent(mUserSession.ID, CreateQuestion.FriendForwardList, createdQuestion.ID);
                var notified = await mNotificationManager.InboxQuestionToFriends(CreateQuestion.FriendForwardList, mMapper.Map<SQuestion>(createdQuestion));

                return 200;
            }
            else
            {
                return -1;
            }
        }

    }
}