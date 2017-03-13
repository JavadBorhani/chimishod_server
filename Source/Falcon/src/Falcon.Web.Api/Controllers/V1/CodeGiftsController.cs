using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    public class CodeGiftsController : FalconApiController
    {
        private readonly ICodeGiftsMaintenanceProcessor mCodeGiftMaintenanceProcessor;

        public CodeGiftsController(ICodeGiftsMaintenanceProcessor CodeGiftMaintenanceProcessor)
        {
            mCodeGiftMaintenanceProcessor = CodeGiftMaintenanceProcessor;
        }

        [ResponseType(typeof(SCodeGift))]
        [Route("GiftCode/Register/{CodeGiftID}")]
        [HttpPost]
        public async Task<SCodeGift> RegisterGiftCode(int CodeGiftID)
        {
            var result = await mCodeGiftMaintenanceProcessor.RegisterGiftCodePrize(CodeGiftID);
            return result;  
        }
    }
}
