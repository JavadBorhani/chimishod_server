using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ISentQueryProcessor
    {
        Task<int> StoreMessage(int UserID, int QuestionID); //Return GroupID
        Task<bool> StoreMessageGroup(int GroupID, int SenderID, int QuestionID, int[] ReceiverID);
    }
}
