using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using AutoMapper;
using Falcon.Data;
using Falcon.Web.Models;
using PagedTaskDataInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.SCharcteristicLeaderBoard>;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class CharacteristicsInquiryProcessor : ICharacteristicsInquiryProcessor
    {
        private readonly ICharacteristicsQueryProcessor mCharacteristicsQueryProcessor;
        private readonly IMapper mMapper;
        public CharacteristicsInquiryProcessor(ICharacteristicsQueryProcessor CharacteristicsQueryProcessor , IMapper Mapper)
        {
            mCharacteristicsQueryProcessor = CharacteristicsQueryProcessor;
            mMapper = Mapper;
        }
        public async Task<List<SCharacteristic>> GetAllCharcterteristicList()
        {
            var itemList = await mCharacteristicsQueryProcessor.FetchAllCharacteristicsWithAliases();

            return itemList;
        }

        public async Task<int[]> GetCategoryAssignedCharacters(int CategoryID)
        {
            var result = await mCharacteristicsQueryProcessor.GetCategoryAssignedCharacters(CategoryID);
            return result;
        }

        public async Task<PagedDataInquiryResponse<SCharcteristicLeaderBoard>> GetLeaderBoard(PagedDataRequest RequestInfo, int CharacterID)
        {
            //TODO : change logic of this 
            var queryResult = await mCharacteristicsQueryProcessor.GetLeaderBoard(RequestInfo, CharacterID);

            var leaderboards = queryResult.QueriedItems.ToList();

            var inquiryResponse = new PagedTaskDataInquiryResponse
            {
                Items = leaderboards,
                PageCount = queryResult.TotalPageCount,
                PageNumber = RequestInfo.PageNumber,
                PageSize = RequestInfo.PageSize
            };

            return inquiryResponse;
        }
    }
}