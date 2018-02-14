using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Answer;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IAnswerQueryProcessor
    {
        Task<int[]> GetUserAnsweredIds(int UserID);
        Task<Answer[]> GetUserAnswers(int[] QuestionIds);
        Task<bool> SaveYesNoAnswer(SYesNoAnswer Response);
        Task<bool> SaveLikeDislikeAnswer(SLikeDislikeAnswer Response);
        
    }
}
