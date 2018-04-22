using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ITelegramMaintenanceProcessor
    {
        Task<bool> BanQuestion(int QuestionID , int State);
    }
}