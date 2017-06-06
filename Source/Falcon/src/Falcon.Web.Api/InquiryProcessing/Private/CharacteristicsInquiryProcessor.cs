using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class CharacteristicsInquiryProcessor : ICharacteristicsInquiryProcessor
    {
        private readonly ICharacteristicsQueryProcessor mCharacteristicsQueryProcessor;

        public CharacteristicsInquiryProcessor(ICharacteristicsQueryProcessor CharacteristicsQueryProcessor)
        {
            mCharacteristicsQueryProcessor = CharacteristicsQueryProcessor;
        }
        public async Task<List<SCharacteristic>> GetAllCharcterteristicList()
        {
            var itemList = await mCharacteristicsQueryProcessor.FetchAllCharacteristicsWithAliases();

            return itemList;
        }
    }
}