using AutoMapper;
using Falcon.Common;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Models.Api.Config;
using Falcon.Web.Models.Api.Initialize;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class InitializationInquiryProcessor : IInitializationInquiryProcessor
    {
        private readonly IUsersInquiryProcessor mUsersQuery;
        private readonly ILevelInquiryProcessor mLevelInquiry;
        private readonly SClientAppState mClientAppState;
        private readonly IServerInquiryProcessor mServerInquiry;
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;
        private readonly IQuestInMemory mQuestInMemroy;

        public InitializationInquiryProcessor
            (
            IUsersInquiryProcessor UsersQuery,
            ILevelInquiryProcessor LevelInquiry,
            IClientApplicationState ClientAppState,
            IServerInquiryProcessor ServerInquiry,
            INotificationData Notification,
            IMapper Mapper , 
            IDateTime DateTime, 
            IQuestInMemory QuestInMemory
            )
        {
            mUsersQuery = UsersQuery;
            mLevelInquiry = LevelInquiry;
            mClientAppState = ClientAppState.State();
            mServerInquiry = ServerInquiry;
            mMapper = Mapper;
            mDateTime = DateTime;
            mQuestInMemroy = QuestInMemory;
        }

        public async Task<SUserInitializationData> LoadUserData(SInitializeInquiry Inquiry)
        {

            var initializationInfo = new SUserInitializationData();

            initializationInfo.ClientAppState = mClientAppState;
            initializationInfo.ClientAppState.ServerTime = mDateTime.Now;

            if (Inquiry.LevelVersionCode < mClientAppState.LevelVersionCode)
            {
                var levels = await mLevelInquiry.GetLevelList();

                initializationInfo.Levels = levels;
            }

            if(Inquiry.QuestVersionCode < mClientAppState.QuestVersionCode)
            {

                var quests = mQuestInMemroy.GetAllQuestItems();
                initializationInfo.Quests = quests;
            }

            var user = await mUsersQuery.GetUserInfo();

            initializationInfo.User = user;

            return initializationInfo;    
        }

        public bool ReloadServerConfig()
        {
            var response = mServerInquiry.ReadConfigurationFilesFromServer();
            return response;
        }
    }
}