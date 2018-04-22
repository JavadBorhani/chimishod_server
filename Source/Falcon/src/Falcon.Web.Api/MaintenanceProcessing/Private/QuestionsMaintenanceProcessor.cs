using AutoMapper;
using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Telegram.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
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
        private readonly IUserQueryProcessor mUserQuery;
        private readonly SClientAppState mClientAppState;
        private readonly IMapper mMapper;
        private readonly ITelegramManager mTelManager;


        public QuestionsMaintenanceProcessor(
            IQuestionsQueryProcessor QuestionQuery , 
            IFriendsInquiryProcessor FriendInquiry , 
            ISentMaintenanceProcessor SentMaintenance , 
            INotificationMaintenanceProcessor NotificationManager,
            IUserQueryProcessor UserQuery,
            IClientApplicationState ClientAppState,
            IUserSession UserSession,
            IMapper Mapper , 
            ITelegramManager TelManager)
        {
            mFriendInquiry = FriendInquiry;
            mQuestionQuery = QuestionQuery;
            mSentMaintenance = SentMaintenance;
            mNotificationManager = NotificationManager;
            mUserSession = UserSession;
            mMapper = Mapper;
            mClientAppState = ClientAppState.State();
            mUserQuery = UserQuery;
            mTelManager = TelManager;
        }

        public async Task<int> CreateQuestion(SCreatedQuestion CreateQuestion)
        {

            var checkout = mClientAppState.CreateQuestionPrice + (CreateQuestion.FriendForwardList.Length * mClientAppState.ForwardPricePerFriend);
            var totalCoin = await mUserQuery.DecreaseCoin(checkout);

            if (totalCoin < 0)
                throw new BusinessRuleViolationException("UserID : " + mUserSession.ID + " , Cheat in Question Creation userID , money is not enough");

            var createdQuestion = await mQuestionQuery.CreateQuestion(CreateQuestion);

            var storedMessageGroupID = await mSentMaintenance.SaveSentPublicMessage(mUserSession.ID, createdQuestion.ID);

            if (CreateQuestion.FriendForwardList != null && CreateQuestion.FriendForwardList.Length > 0)
            {
                var friendIdsExists = await mFriendInquiry.HasFriends(CreateQuestion.FriendForwardList);

                if(friendIdsExists)
                {
                    var stored = await mSentMaintenance
                        .SavePublicQuestionToFriends(mUserSession.ID, createdQuestion.ID ,storedMessageGroupID , CreateQuestion.FriendForwardList);

                    var notified = await mNotificationManager
                        .InboxQuestionToFriends(CreateQuestion.FriendForwardList, mMapper.Map<SQuestion>(createdQuestion));
                }
                else
                {
                    throw new BusinessRuleViolationException("Cheat in Question Creation" + mUserSession.ID);
                }
            }

            if (createdQuestion != null)
                await mTelManager.SendQuestionVerifier(createdQuestion.ID, createdQuestion.What_if, createdQuestion.But);

            return totalCoin;

        }

        public async Task<int> ForwardQuestionToFriends(SForwardQuestion ForwardQuestion)
        {

            var checkout = (ForwardQuestion.FriendIDs.Length * mClientAppState.ForwardPricePerFriend);
            var totalCoin = await mUserQuery.DecreaseCoin(checkout);

            if (totalCoin < 0)
                throw new BusinessRuleViolationException("UserID : " + mUserSession.ID + " , Cheat in Question Forward ,  money is not enough");


            var question = await mQuestionQuery.GetQuestionByID(ForwardQuestion.QuestionID);

            if (question != null && question.Banned == false && question.HashTagID != (int)HashTagID.Quest)
            {

                var friendIdsExists = await mFriendInquiry.HasFriends(ForwardQuestion.FriendIDs);

                if (friendIdsExists)
                {
                    var stored = await mSentMaintenance.SaveMessageSent(mUserSession.ID, ForwardQuestion.FriendIDs, question.ID);
                    var notified = await mNotificationManager.InboxQuestionToFriends(ForwardQuestion.FriendIDs, mMapper.Map<SQuestion>(question));
       
                }
                return totalCoin;
            }
            return -1;

        }

        public async Task<bool> BanQuestion(int QuestionID, int State)
        {
            var booleanState = (State == 1) ? true : false;

            var response = await mQuestionQuery.BanQuestion(QuestionID, booleanState);

            return response;
        }
    }
}