using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
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
        public CharacteristicsController(ICharacteristicsMaintenanceProcessor CharacteristicsMaintenanceProcessor ,
            ICharacteristicsInquiryProcessor CharacteristicsInquiryProcessor)
        {
            mCharacteristicsMaintenanceProcessor = CharacteristicsMaintenanceProcessor;
            mCharacteristicsInquiryProcessor = CharacteristicsInquiryProcessor;
        }

        [Route("Characteristics/")]
        [HttpPost]
        public async Task<List<SCharacteristic>> GetCharacterisitcsList()
        {
            var result = await mCharacteristicsInquiryProcessor.GetAllCharcterteristicList();
            return result;  
        }

    }
}