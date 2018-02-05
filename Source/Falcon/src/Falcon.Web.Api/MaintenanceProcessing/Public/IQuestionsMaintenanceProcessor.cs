using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IQuestionsMaintenanceProcessor
    {
        Task<int> CreateQuestion(SCreatedQuestion CreateQuestion); 
    }
}