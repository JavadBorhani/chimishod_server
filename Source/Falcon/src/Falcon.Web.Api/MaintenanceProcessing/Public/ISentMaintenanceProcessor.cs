using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ISentMaintenanceProcessor
    {
        Task<bool> SaveMessageSent(int SenderID, int[] ReceiverIDs, int QuestionID);
    }
}