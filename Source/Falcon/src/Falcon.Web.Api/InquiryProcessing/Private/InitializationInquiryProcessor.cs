using AutoMapper;
using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Notification.Public;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class InitializationInquiryProcessor : IInitializationInquiryProcessor
    {
        private readonly IUsersInquiryProcessor mUsersQuery;
        private readonly ILevelInquiryProcessor mLevelInquiry;
        private readonly IClientApplicationState mClientAppState;
        private readonly IServerInquiryProcessor mServerInquiry;
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;

        public InitializationInquiryProcessor
            (
            IUsersInquiryProcessor UsersQuery,
            ILevelInquiryProcessor LevelInquiry,
            IClientApplicationState ClientAppState,
            IServerInquiryProcessor ServerInquiry,
            INotificationData Notification,
            IMapper Mapper , 
            IDateTime DateTime
            )
        {
            mUsersQuery = UsersQuery;
            mLevelInquiry = LevelInquiry;
            mClientAppState = ClientAppState;
            mServerInquiry = ServerInquiry;
            mMapper = Mapper;
            mDateTime = DateTime;
        }

        public async Task<SUserInitializationData> LoadUserData(int LevelVersion)
        {

            var initializationInfo = new SUserInitializationData();

            initializationInfo.ClientAppState = mClientAppState.State();
            initializationInfo.ClientAppState.ServerTime = mDateTime.Now;


            if (LevelVersion < mClientAppState.State().LevelVersionCode)
            {
                var levels = await mLevelInquiry.GetLevelList();

                initializationInfo.Levels = levels;
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