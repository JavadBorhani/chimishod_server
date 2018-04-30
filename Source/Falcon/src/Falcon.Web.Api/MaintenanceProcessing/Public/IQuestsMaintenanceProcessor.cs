using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IQuestsMaintenanceProcessor
    {
        Task<bool> AddScore(int QuestionID , bool IsYes);
        Task<bool> TakeSnapshot();
        Task<bool> SaveQuestQuestionAnswer(SQuestAnswer Answer);
        Task<bool> PurchaseQuest(int QuestNumber);
    }
}