using Falcon.Web.Models.Api.Input.Questions;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface ICreatedQuestionsMaintenanceProcessor
    {
        Task<bool> DeleteLogically(RemoveInfo Info);
        Task<bool> Edit(EditInfo Info);
    }
}