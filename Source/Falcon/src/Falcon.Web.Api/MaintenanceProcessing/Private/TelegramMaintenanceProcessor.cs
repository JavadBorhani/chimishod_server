using Falcon.Common.Logging;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities;
using log4net;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class TelegramMaintenanceProcessor : ITelegramMaintenanceProcessor
    {
        private readonly INetworkUtils mNetworkUtils;
        private readonly IQuestionsMaintenanceProcessor mQuestionMaintenance;
        private readonly ILog mLogger;
        

        public TelegramMaintenanceProcessor(        
            INetworkUtils NetworkUtils,
            IQuestionsMaintenanceProcessor QuestionMaintenance,
            ILogManager mLogManager)
        {
            mNetworkUtils = NetworkUtils;
            mQuestionMaintenance = QuestionMaintenance;
            mLogger = mLogManager.GetLog(typeof(TelegramMaintenanceProcessor));
        }


        public async Task<bool> ActivateQuestion(int QuestionID, int State)
        {
            var ipIsLocal = mNetworkUtils.IsIpInternal();
            var validState = (QuestionID > 0 && (State == 1 || State == 0)) ? true : false;

            if ((ipIsLocal && validState))
            {
                var happened = await mQuestionMaintenance.ActivateQuestion(QuestionID, State);
                return happened;
            }
            else
            {
                mLogger.Error("could not ban question + network Ip : " + mNetworkUtils.GetRequestNetworkIP() +  "\n" + " valid ip : " + ipIsLocal);
            }
            return false;
        }
    }
}