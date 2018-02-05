using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
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
    }
}
