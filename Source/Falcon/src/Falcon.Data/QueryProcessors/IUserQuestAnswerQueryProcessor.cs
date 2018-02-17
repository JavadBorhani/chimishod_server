using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IUserQuestAnswerQueryProcessor
    {
        Task<bool> AddUserAnswer(SUserQuestAnswer[] Answer);
        Task<bool> AddUserAnswer(SUserQuestAnswer Answer);
    }
}
