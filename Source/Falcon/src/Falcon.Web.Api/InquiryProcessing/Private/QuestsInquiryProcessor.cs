using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api.Quest;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestsInquiryProcessor : IQuestsInquiryProcessor
    {
        private readonly IQuestsQueryProcessor mQuestQuery;
        private readonly IMapper mMapper;
        public QuestsInquiryProcessor(IQuestsQueryProcessor QuestQueryProcessor , IMapper Mapper)
        {
            mQuestQuery = QuestQueryProcessor;
            mMapper = Mapper;
        }
        public async Task<SQuest[]> GetQuestList()
        {
            var query = await mQuestQuery.GetAllQuests();
            var data = mMapper.Map<SQuest[]>(query);
            return data;
        }
    }
}