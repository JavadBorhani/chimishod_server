using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class ServerInquiryProcessor : IServerInquiryProcessor
    {
        private readonly IClientApplicationState mClientAppState;
        private readonly IGlobalApplicationState mGlobalAppState;
        private readonly IGameConfig mGameConfig;
        private readonly IQuestInMemoryProcessor mQuestProcessor;
        public ServerInquiryProcessor(IClientApplicationState ClientAppState ,IGlobalApplicationState GlobalAppState , IGameConfig GameConfig , IQuestInMemoryProcessor QuestsInMemoryProcessor)
        {
            mClientAppState = ClientAppState;
            mGlobalAppState = GlobalAppState;
            mGameConfig = GameConfig;
            mQuestProcessor = QuestsInMemoryProcessor;
        }
        public async Task<bool> ReadConfigurationFilesFromServer()
        {
            mClientAppState.ReadStateFromDatabase();
            mGlobalAppState.ReadStateFromDatabase();
            mGameConfig.ReadStateFromDatabase();
            mQuestProcessor.ReadStateFromDatabase();

            return true;
        }
    }
}