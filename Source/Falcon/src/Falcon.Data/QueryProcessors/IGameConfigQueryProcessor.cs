using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IGameConfigQueryProcessor
    {
        Task<QuestionSelectorConfig> GetQuestionConfiguration();
    }
}
