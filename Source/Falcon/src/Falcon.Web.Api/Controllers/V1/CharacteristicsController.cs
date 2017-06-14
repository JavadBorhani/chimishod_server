using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    public class CharacteristicsController : FalconApiController
    {
        private readonly ICharacteristicsMaintenanceProcessor mCharacteristicsMaintenanceProcessor;
        private readonly ICharacteristicsInquiryProcessor mCharacteristicsInquiryProcessor;
        private readonly IPagedDataRequestFactory mPagedDataRequestFactory;
        private readonly SApplicationState mAppState; 

        public CharacteristicsController(ICharacteristicsMaintenanceProcessor CharacteristicsMaintenanceProcessor ,
            ICharacteristicsInquiryProcessor CharacteristicsInquiryProcessor ,
            IPagedDataRequestFactory PagedDataRequestFactory , 
            IGlobalApplicationState AppState)
        {
            mCharacteristicsMaintenanceProcessor = CharacteristicsMaintenanceProcessor;
            mCharacteristicsInquiryProcessor = CharacteristicsInquiryProcessor;
            mPagedDataRequestFactory = PagedDataRequestFactory;
            mAppState = AppState.GetState();
        }

        [Route("Characteristics/")]
        [HttpPost]
        public async Task<List<SCharacteristic>> GetCharacterisitcsList()
        {
            var result = await mCharacteristicsInquiryProcessor.GetAllCharcterteristicList();
            return result;  
        }

        [Route("Characteristics/LeaderBoard/{CharacterID}/{PageNumber}")]
        [HttpPost]
        public async Task<SCharcteristicLeaderBoard> LeaderBoard(int CharacterID , int PageNumber)
        {
            var pagedData = mPagedDataRequestFactory.Create(PageNumber, mAppState.Paging_DefaultPageSize);
            var result = await mCharacteristicsInquiryProcessor.GetLeaderBoard(pagedData , CharacterID);
            return result;
        }
    }
}