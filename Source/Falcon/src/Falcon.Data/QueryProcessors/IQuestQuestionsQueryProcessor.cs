using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestQuestionsQueryProcessor
    {
        Task<bool> SaveQuestQuestionAnswer(SQuestAnswer);
    }
}
