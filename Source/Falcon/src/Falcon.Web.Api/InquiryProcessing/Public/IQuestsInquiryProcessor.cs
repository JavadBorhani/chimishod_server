using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Barrett;
using Falcon.Web.Models.Api.Quest;
using Falcon.Web.Models.Api.User;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IQuestsInquiryProcessor
    {
        Task<SQuest[]> GetQuestList();
        Task<SQuestion[]> GetQuestQuestions(int QuestNumber);
        Task<SQuestDetail[]> GetQuestDetail(SQuestInquiry Inquiry);
        Task<SFriendQuestDetail[]> GetFriendQuestDetail(SQuestInquiry Inquiry);
        Task<SFinaleQuest> GetFinaleQuestDescription();
        Task<SFinaleQuest> GetFinaleQuestDescription(List<SBarrettUserScore> Items);
        Task<List<SBarrettUserScore>> GetFinaleQuestDetail();
        Task<SUserFinaleQuestDetailWithDescription> GetFinaleQuestDetailWithDescription();
    }
}