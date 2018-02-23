using Falcon.Web.Models.Api.Feedback;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IFeedbackMaintenanceProcessor
    {
        Task<bool> SaveFeedback(SFeedback inquiry);
    }
}
