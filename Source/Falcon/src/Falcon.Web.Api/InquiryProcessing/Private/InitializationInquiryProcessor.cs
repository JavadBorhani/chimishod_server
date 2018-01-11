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
        private readonly ILevelInquiryProcessor mLevelQuery;
        private readonly IClientApplicationState mClientAppState;
        private readonly IMapper mMapper;
        public InitializationInquiryProcessor
            ( 
            IUsersInquiryProcessor UsersQuery , 
            ILevelInquiryProcessor LevelQuery , 
            IClientApplicationState ClientAppState,
            IMapper Mapper
            )
        {
            mUsersQuery = UsersQuery;
            mLevelQuery = LevelQuery;
            mClientAppState = ClientAppState;
            mMapper = Mapper;   
        }

        public async Task<SUserInitializationData> LoadUserData(int LevelVersion)
        {

            var initializationInfo = new SUserInitializationData();

            initializationInfo.ClientAppState = mClientAppState.State();

            return null;
        }

    }
}