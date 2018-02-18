using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class SentMaintenanceProcessor : ISentMaintenanceProcessor
    {
        private readonly ISentQueryProcessor mSentQuery;
        private readonly IDateTime mDateTime;

        public SentMaintenanceProcessor(ISentQueryProcessor SentQuery , IDateTime DateTime)
        {
            mSentQuery = SentQuery;
            mDateTime  = DateTime;
        }

        public async Task<bool> SaveMessageSent(int SenderID, int[] ReceiverIDs, int QuestionID)
        {
         
            var messageGroupID = await mSentQuery.SaveMessage(SenderID, QuestionID);
            var message = await mSentQuery.SaveMessageGroup(messageGroupID, SenderID, QuestionID, ReceiverIDs);

            return message;
        }

        public async Task<int> SaveSentPublicMessage(int SenderID, int QuestionID)
        {
            var messageGroupID = await mSentQuery.SaveMessage(SenderID, QuestionID);
            return messageGroupID;
        }

        public async Task<bool> SavePublicQuestionToFriends(int SenderID, int QuestionID , int MessageGroupID , int[] ReceiverIDs)
        {
            var message = await mSentQuery.SaveMessageGroup(MessageGroupID, SenderID, QuestionID, ReceiverIDs);

            return message;
        }
    }
}