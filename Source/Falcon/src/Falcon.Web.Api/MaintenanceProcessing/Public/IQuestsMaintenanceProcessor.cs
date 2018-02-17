using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IQuestsMaintenanceProcessor
    {
        Task<bool> AddScore(int QuestionID , bool IsYes);
    }
}