using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Answer;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IAnswerMaintenanceProcessor
    {
        Task<bool> SaveReportedAnswer(int QuestionID);
        Task<bool> SaveAnswer(SAnswer Answer);
        Task<bool> SaveYesNoAnswer(SYesNoAnswer Response);
        Task<bool> SaveLikeDislikeAnswer(SLikeDislikeAnswer Response);
    }
}