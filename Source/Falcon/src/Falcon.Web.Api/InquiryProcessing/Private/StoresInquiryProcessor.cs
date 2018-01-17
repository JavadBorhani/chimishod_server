using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class StoresInquiryProcessor : IStoresInquiryProcessor
    {
        private readonly IStoresQueryProcessor mStoreQueryProcessor;
        private readonly IMarketInfoQueryProcessor mMarketQueryProcessor;
        private readonly IMapper mMapper;

        public StoresInquiryProcessor(IStoresQueryProcessor StoreQueryProcessor , IMarketInfoQueryProcessor MarketQueryProcessor , IMapper Mapper)
        {
            mStoreQueryProcessor = StoreQueryProcessor;
            mMarketQueryProcessor = MarketQueryProcessor;
            mMapper = Mapper;
        }
        public async Task<SStore[]> GetStoreList(int StoreKey)
        {
            int id = await mMarketQueryProcessor.GetMarketIdByMarketKey(StoreKey);
            if(id > 0)
            {
                var result = await mStoreQueryProcessor.GetStoreListByMarketId(id);

                if(result.Length > 0)
                {
                    var response = mMapper.Map<SStore[]>(result);
                    return response;
                }
            }
            return null;
        }
    }
}