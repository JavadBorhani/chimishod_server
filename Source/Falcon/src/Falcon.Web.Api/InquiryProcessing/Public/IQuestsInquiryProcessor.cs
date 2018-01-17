using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IQuestsInquiryProcessor
    {
        Task<SQuest[]> GetQuestList();
        Task<SQuestion[]> GetQuestQuestions(int QuestNumber);
    }
}