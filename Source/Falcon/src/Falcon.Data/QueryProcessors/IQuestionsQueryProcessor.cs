using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestionsQueryProcessor
    {
        Task<bool> LogicallyRemoveByCreator(int QuestionID);
        Task<bool> IsDeletable(int QuestionID);
        Task<Question[]> GetQuestionList(bool IsPublic , int HashtagID,  int[] Excepts = null);
    }
}
