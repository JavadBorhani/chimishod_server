using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api.Config;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class GameConfigInqiuryProcessor : IGameConfigInquiryProcessor
    {
        private readonly IGameConfigQueryProcessor mGameConfigQuery;
        private readonly IMapper mMapper;
        public GameConfigInqiuryProcessor(IGameConfigQueryProcessor GameConfigQuery , IMapper Mapper)
        {
            mGameConfigQuery = GameConfigQuery;
            mMapper = Mapper;   
        }
        public async Task<SQuestionSelectorConfig> GetQuestionSelectorConfig()
        {
            var config = await mGameConfigQuery.GetQuestionConfiguration();
            return mMapper.Map<SQuestionSelectorConfig>(config);
        }
    }
}