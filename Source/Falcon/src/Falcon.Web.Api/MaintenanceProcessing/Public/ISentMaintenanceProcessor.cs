using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ISentMaintenanceProcessor
    {
        Task<bool> SaveMessageSent(int SenderID, int[] ReceiverIDs, int QuestionID);
        Task<int> SaveSentPublicMessage(int SenderID, int QuestionID);
        Task<bool> SavePublicQuestionToFriends(int SenderID, int QuestionID, int MessageGroupID, int[] ReceiverIDs);
    }
}