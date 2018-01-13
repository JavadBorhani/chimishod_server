using AutoMapper;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class InitializationInquiryProcessor : IInitializationInquiryProcessor
    {
        private readonly IUsersInquiryProcessor mUsersQuery;
        private readonly ILevelInquiryProcessor mLevelInquiry;
        private readonly IClientApplicationState mClientAppState;
        private readonly IMapper mMapper;
        public InitializationInquiryProcessor
            (
            IUsersInquiryProcessor UsersQuery,
            ILevelInquiryProcessor LevelInquiry,
            IClientApplicationState ClientAppState,
            IMapper Mapper
            )
        {
            mUsersQuery = UsersQuery;
            mLevelInquiry = LevelInquiry;
            mClientAppState = ClientAppState;
            mMapper = Mapper;
        }

        public async Task<SUserInitializationData> LoadUserData(int LevelVersion)
        {

            var initializationInfo = new SUserInitializationData();

            initializationInfo.ClientAppState = mClientAppState.State();


            if (LevelVersion < mClientAppState.State().LevelVersionCode)
            {
                var levels = await mLevelInquiry.GetLevelList();

                initializationInfo.Levels = levels;
            }

            var user = await mUsersQuery.GetUserInfo();

            initializationInfo.User = user;

            return initializationInfo;    
        }

    }
}