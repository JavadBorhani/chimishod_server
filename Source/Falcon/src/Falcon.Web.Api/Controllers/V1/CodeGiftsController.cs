using Falcon.EFCommonContext;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class CodeGiftsController : FalconApiController
    {
        private readonly ICodeGiftsMaintenanceProcessor mCodeGiftMaintenanceProcessor;

        private readonly IDbContext mDb;
        public CodeGiftsController(ICodeGiftsMaintenanceProcessor CodeGiftMaintenanceProcessor)
        {
            mCodeGiftMaintenanceProcessor = CodeGiftMaintenanceProcessor;
        }

        [ResponseType(typeof(SCodeGift))]
        [Route("GiftCode/Register/{CodeGiftSerial}")]
        [HttpPost]
        public async Task<SCodeGift> RegisterGiftCode([FromUri] string CodeGiftSerial)
        {
            var result = await mCodeGiftMaintenanceProcessor.RegisterGiftCodePrize(CodeGiftSerial);
            return result;  
            
        }
    }
}
