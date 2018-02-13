using AutoMapper;
using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Question;
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


            var createdQuestion = await mQuestionQuery.CreateQuestion(CreateQuestion);

            if (CreateQuestion.FriendForwardList != null && CreateQuestion.FriendForwardList.Length > 0)
            {
                var friendIdsExists = await mFriendInquiry.HasFriends(CreateQuestion.FriendForwardList);

                if(friendIdsExists)
                {
                    var stored = await mSentMaintenance.StoreMessageSent(mUserSession.ID, CreateQuestion.FriendForwardList, createdQuestion.ID);
                    var notified = await mNotificationManager.InboxQuestionToFriends(CreateQuestion.FriendForwardList, mMapper.Map<SQuestion>(createdQuestion));
                    return 200;
                }
                else
                {
                    throw new BusinessRuleViolationException("Cheat in Question Creation" + mUserSession.ID);
                }
            }
            else if( createdQuestion != null)
            {
                return 200;
            }
            else
            {
                return -1; 
            }
        }

        public async Task<int> ForwardQuestionToFriends(SForwardQuestion ForwardQuestion)
        {
            //remember to decrease money;
            var question = await mQuestionQuery.GetQuestionByID(ForwardQuestion.QuestionID);

            if (question != null && question.Banned == false && question.HashTagID != (int)HashTagID.Quest)
            {

                var friendIdsExists = await mFriendInquiry.HasFriends(ForwardQuestion.FriendIDs);

                if (friendIdsExists)
                {
                    var stored = await mSentMaintenance.StoreMessageSent(mUserSession.ID, ForwardQuestion.FriendIDs, question.ID);
                    var notified = await mNotificationManager.InboxQuestionToFriends(ForwardQuestion.FriendIDs, mMapper.Map<SQuestion>(question));

                    return 200;
                }
            }
            return -1;

        }
    }
}