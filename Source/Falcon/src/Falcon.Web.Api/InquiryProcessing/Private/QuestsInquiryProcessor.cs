using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestsInquiryProcessor : IQuestsInquiryProcessor
    {
        private readonly IQuestsQueryProcessor mQuestQuery;
        private readonly IMapper mMapper;
        private readonly IQuestInMemoryProcessor mQuestInMemory;

        public QuestsInquiryProcessor(IQuestsQueryProcessor QuestQueryProcessor , IMapper Mapper , IQuestInMemoryProcessor QuestInMemory)
        {
            mQuestQuery = QuestQueryProcessor;
            mMapper = Mapper;
            mQuestInMemory = QuestInMemory;
        }
        public async Task<SQuest[]> GetQuestList()
        {
            var query = await mQuestQuery.GetAllQuests();

            var data = mMapper.Map<SQuest[]>(query);

            return data;
        }

        public async Task<SQuestion[]> GetQuestQuestions(int QuestNumber)
        {
            var questions = await mQuestQuery.GetQuestQuestions(QuestNumber);

            return mMapper.Map<SQuestion[]>(questions);
        }

        public async Task<SQuestDetail[]> GetQuestDetail(SQuestInquiry Inquiry)
        {
            if(Inquiry.Alive)
            {
                //fetching quest information from quest;
                var questDetail = await mQuestQuery.GetQuestDetail(Inquiry);

                return questDetail.Length > 0 ? questDetail : null;
            }
            else
            {
                //TODO : call without alive 
                return null;
            }
            
        }

        public async Task<SFriendQuestDetail[]> GetFriendQuestDetail(int FriendID, int QuestNumber)
        {
            var friendQuestDetail = await mQuestQuery.GetFriendQuestDetail(FriendID, QuestNumber);

            return friendQuestDetail.Length > 0 ? friendQuestDetail : null ;
        }
    }
}