using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class SentMaintenanceProcessor : ISentMaintenanceProcessor
    {
        private readonly ISentQueryProcessor mSentQuery;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;

        public SentMaintenanceProcessor(ISentQueryProcessor SentQuery , IDateTime DateTime , IUserSession UserSession)
        {
            mSentQuery = SentQuery;
            mDateTime = DateTime;
        }

        public async Task<bool> StoreMessageSent(int SenderID, int[] ReceiverIDs, int QuestionID)
        {
         
            var messageGroupID = await mSentQuery.StoreMessage(SenderID, QuestionID);
            var message = await mSentQuery.StoreMessageGroup(messageGroupID, SenderID, QuestionID, ReceiverIDs);

            return message;
        }
    }
}