using Falcon.Web.Models.Api.Question;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ISentMaintenanceProcessor
    {
        Task<bool> StoreMessageSent(int SenderID, int[] ReceiverIDs, int QuestionID);
        Task<bool> ForwardQuestionToFriends(SForwardQuestion QuestionInfo);
    }
}