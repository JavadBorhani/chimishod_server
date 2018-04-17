﻿using Falcon.Web.Api.InMemory.Public;
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
        private readonly IUsersInMemory mUserInMemory;
        private readonly IReportInMemory mReportInMemory;

        public ServerInquiryProcessor(
            IClientApplicationState ClientAppState ,
            IGlobalApplicationState GlobalAppState , 
            IGameConfig GameConfig , 
            IQuestInMemoryProcessor QuestsInMemoryProcessor , 
            INotificationData Notification , 
            IUsersInMemory UserInMemory,
            IReportInMemory ReportInMemory)
        {
            mNotificationData = Notification;
            mClientAppState = ClientAppState;
            mGlobalAppState = GlobalAppState;
            mGameConfig = GameConfig;
            mQuestProcessor = QuestsInMemoryProcessor;
            mUserInMemory = UserInMemory;
            mReportInMemory = ReportInMemory;
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

            return true;
        }
    }
}