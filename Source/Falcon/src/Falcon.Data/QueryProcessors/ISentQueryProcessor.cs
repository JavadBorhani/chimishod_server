using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ISentQueryProcessor
    {
        Task<int> SaveMessage(int UserID, int QuestionID); //Return GroupID
        Task<bool> SaveMessageGroup(int GroupID, int SenderID, int QuestionID, int[] ReceiverID);
        Task<QueryResult<SQuestionWithAnswerState>> GetUserInboxMessages(PagedDataRequest RequestInfo);
        Task<QueryResult<SQuestionWithAnswerState>> GetUserSentMessages(PagedDataRequest RequestInfo);
    }
}
