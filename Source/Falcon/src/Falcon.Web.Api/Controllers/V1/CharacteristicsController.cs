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
        [Route("Characteristics/Test")]
        [HttpPost]
        public async Task<IHttpActionResult> Test()
        {
            var result = await mCharacteristicsMaintenanceProcessor.AddUserToLeaderBoard(new int [] { 4,1 });
            return null;
        }

        [Route("Characteristics/LeaderBoard")]
        [HttpPost]
        public async Task<IHttpActionResult> LeaderBoard()
        {
            var result = await mCharacteristicsMaintenanceProcessor.AddUserToLeaderBoard(new int[] { 4, 1 });
            return null;
        }

        [Route("Characteristics/")]
        [HttpPost]
        public async Task<IHttpActionResult> Board()
        {
            var result = await mCharacteristicsMaintenanceProcessor.AddUserToLeaderBoard(new int[] { 4, 1 });
            return null;
        }

    }
}