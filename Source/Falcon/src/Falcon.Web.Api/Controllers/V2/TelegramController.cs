using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class TelegramController : FalconApiController
    {
        private readonly ITelegramMaintenanceProcessor mTelegMaintenance;

        public TelegramController(ITelegramMaintenanceProcessor TelegMaintenance)
        {
            mTelegMaintenance = TelegMaintenance;
      
        }

        [Route("v2/TelegramController/{QuestionID}/{State}")]
        [HttpPost]
        public async Task<bool> BanQuestion(int QuestionID, int State)
        {
            var response = await mTelegMaintenance.ActivateQuestion(QuestionID, State);
            return response;
        }

    }
}
