using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Notification.Public;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class ServerInquiryProcessor : IServerInquiryProcessor
    {
        private readonly IClientApplicationState mClientAppState;
        private readonly IGlobalApplicationState mGlobalAppState;
        private readonly IGameConfig mGameConfig;
        private readonly IQuestAndLevelInMemory mQuestProcessor;
        private readonly INotificationData mNotificationData;
        private readonly IUsersInMemory mUserInMemory;
        private readonly IReportInMemory mReportInMemory;
        //private readonly ITelegramConfigurationInMemory mTelegramConfiguration;
        private readonly IQuestionNotifyConfigInMemory mQuestionNotifyConfig;

        public ServerInquiryProcessor(
            IClientApplicationState ClientAppState ,
            IGlobalApplicationState GlobalAppState , 
            IGameConfig GameConfig , 
            IQuestAndLevelInMemory QuestsInMemoryProcessor , 
            INotificationData Notification , 
            IUsersInMemory UserInMemory,
            IReportInMemory ReportInMemory , 
            ITelegramConfigurationInMemory TelegramConfiguration , 
            IQuestionNotifyConfigInMemory QuestionNotifyConfig)
        {
            mNotificationData = Notification;
            mClientAppState = ClientAppState;
            mGlobalAppState = GlobalAppState;
            mGameConfig = GameConfig;
            mQuestProcessor = QuestsInMemoryProcessor;
            mUserInMemory = UserInMemory;
            mReportInMemory = ReportInMemory;
            //mTelegramConfiguration = TelegramConfiguration;
            mQuestionNotifyConfig = QuestionNotifyConfig;
        }
        public bool ReadConfigurationFilesFromServer()
        {
            mClientAppState.ReadStateFromDatabase();
            mGlobalAppState.ReadStateFromDatabase();
            mGameConfig.ReadStateFromDatabase();
            mQuestProcessor.ReadStateFromDatabase();
            mNotificationData.ReadStateFromDatabase();
            mUserInMemory.ReadStateFromDatabase();
            mReportInMemory.ReadStateFromDatabase();
            //mTelegramConfiguration.ReadStateFromDatabase();
            mQuestionNotifyConfig.ReadStateFromDatabase();

            return true;
        }

        public bool AddWarmUpConfiguration()
        {
            return false;
        }
    }
}