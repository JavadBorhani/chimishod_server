using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IQuestsMaintenanceProcessor
    {
        Task<bool> AddScore(int QuestionID , int CurrentUserQuestNumber, bool IsYes);
        Task<bool> TakeSnapshot(int QuestNumber);
        Task<bool> SaveQuestQuestionAnswer(SQuestAnswer Answer);
        Task<bool> PurchaseQuest(int QuestNumber);
    }
}