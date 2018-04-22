using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ITelegramMaintenanceProcessor
    {
        Task<bool> ActivateQuestion(int QuestionID , int State);
    }
}