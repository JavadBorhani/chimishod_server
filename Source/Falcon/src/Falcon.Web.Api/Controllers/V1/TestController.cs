using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {

        private readonly IAchievementMaintenanceProcessor mAchievementProcessor;

        public TestController(IAchievementMaintenanceProcessor AchievementController)
        {
            mAchievementProcessor = AchievementController;
        }

        [Route("TestController/{UserID}")]
        [HttpPost]
        public async Task<IHttpActionResult> CreateJob(int UserID)
        {
            var data = await mAchievementProcessor.PrepareAchievementList();
            return Ok(data);
        }
    }
}