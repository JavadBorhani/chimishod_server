using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestQuestionsQueryProcessor
    {
        Task<bool> SaveQuestQuestionAnswer(SQuestAnswer QuestAnswer);
        Task<bool> Exists(int UserID, int QuestionID);
    }
}
