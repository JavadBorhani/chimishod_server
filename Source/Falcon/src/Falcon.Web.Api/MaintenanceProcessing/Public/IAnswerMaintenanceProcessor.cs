using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IAnswerMaintenanceProcessor
    {
        Task<bool> Answer(SAnswer Answer);
    }
}