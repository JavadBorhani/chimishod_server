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
        private readonly IQuestInMemory mQuestProcessor;
        private readonly INotificationData mNotificationData;
        private readonly IUsersInMemory mUserInMemory;
        private readonly IReportInMemory mReportInMemory;
        private readonly ITelegramConfigurationInMemory mTelegramConfiguration;

        public ServerInquiryProcessor(
            IClientApplicationState ClientAppState ,
            IGlobalApplicationState GlobalAppState , 
            IGameConfig GameConfig , 
            IQuestInMemory QuestsInMemoryProcessor , 
            INotificationData Notification , 
            IUsersInMemory UserInMemory,
            IReportInMemory ReportInMemory , 
            ITelegramConfigurationInMemory TelegramConfiguration)
        {
            mNotificationData = Notification;
            mClientAppState = ClientAppState;
            mGlobalAppState = GlobalAppState;
            mGameConfig = GameConfig;
            mQuestProcessor = QuestsInMemoryProcessor;
            mUserInMemory = UserInMemory;
            mReportInMemory = ReportInMemory;
            mTelegramConfiguration = TelegramConfiguration;
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
            mTelegramConfiguration.ReadStateFromDatabase();

            return true;
        }
    }
}