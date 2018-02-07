using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public enum OrderBy
    {
        None,
        DateTime,
        DateTimeAndWeight,
        CountDateTimeWeight,
        CountDateTimeAscending
    }
    public interface IQuestionsQueryProcessor
    {
        Task<bool> LogicallyRemoveByCreator(int QuestionID);
        Task<bool> IsDeletable(int QuestionID);
        Task<int> GetQuestionReportCount(int QuestionID);
        Task<bool> BanQuestion(int QuestionID);
        Task<Question> CreateQuestion(SCreatedQuestion NewQuestion); 
        Task<Question[]> GetQuestionList(bool IsPublic , int HashtagID, int Amount, OrderBy OrderBy = OrderBy.None,  int[] Excepts = null);
        Task<QueryResult<SPublicQuestionWithAnswerState>> GetUserPublicQuestions(PagedDataRequest RequestInfo, int UserID);
        Task<QueryResult<SPublicQuestionWithAnswerState>> GetUserMutualQuestions(PagedDataRequest RequestInfo, int UserID);
    }
}
