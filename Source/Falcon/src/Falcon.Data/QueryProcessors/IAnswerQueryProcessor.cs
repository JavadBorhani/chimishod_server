using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAnswerQueryProcessor
    {
        Task<int[]> GetUserAnsweredIds(int UserID);
        Task<Answer[]> GetUserAnswers(int[] QuestionIds);
    }
}
