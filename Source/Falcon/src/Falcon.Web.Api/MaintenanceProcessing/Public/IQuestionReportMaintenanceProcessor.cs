using Falcon.Web.Models.Api.Report;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IQuestionReportMaintenanceProcessor
    {
        Task<bool> ReportQuestion(SReportedQuestion Reported);
    }
}