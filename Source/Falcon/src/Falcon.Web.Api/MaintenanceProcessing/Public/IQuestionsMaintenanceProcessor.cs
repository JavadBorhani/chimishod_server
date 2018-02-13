using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Question;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IQuestionsMaintenanceProcessor
    {
        Task<int> CreateQuestion(SCreatedQuestion CreateQuestion);
        Task<int> ForwardQuestionToFriends(SForwardQuestion ForwardQuestion); 
    }
}