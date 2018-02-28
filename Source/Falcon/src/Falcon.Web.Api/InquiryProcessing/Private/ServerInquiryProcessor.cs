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
        private readonly IQuestInMemoryProcessor mQuestProcessor;
        private readonly INotificationData mNotificationData;
        public ServerInquiryProcessor(
            IClientApplicationState ClientAppState ,
            IGlobalApplicationState GlobalAppState , 
            IGameConfig GameConfig , 
            IQuestInMemoryProcessor QuestsInMemoryProcessor , 
            INotificationData Notification)
        {
            mNotificationData = Notification;
            mClientAppState = ClientAppState;
            mGlobalAppState = GlobalAppState;
            mGameConfig = GameConfig;
            mQuestProcessor = QuestsInMemoryProcessor;
        }
        public bool ReadConfigurationFilesFromServer()
        {
            mClientAppState.ReadStateFromDatabase();
            mGlobalAppState.ReadStateFromDatabase();
            mGameConfig.ReadStateFromDatabase();
            mQuestProcessor.ReadStateFromDatabase();
            mNotificationData.ReadStateFromDatabase();
            return true;
        }
    }
}