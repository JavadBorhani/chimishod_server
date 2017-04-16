using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using AutoMapper;

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
        public async Task<List<SStore>> GetStoreList(int StoreKey)
        {
            int id = await mMarketQueryProcessor.GetMarketIdByMarketKey(StoreKey);
            if(id > 0)
            {
                var result = await mStoreQueryProcessor.GetStoreListByMarketId(id);

                if(result.Count > 0)
                {
                    var response = mMapper.Map<List<SStore>>(result);
                    return response;
                }
            }
            return null;
        }
    }
}