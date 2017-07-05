using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Common.Memmory;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        private readonly IUsersMaintenanceProcessor mUsersMaintenace;
        private readonly IDbContext mContext;

        public TestController(IUsersMaintenanceProcessor UserMaintenacne , IDbContext Database)
        {
            mUsersMaintenace = UserMaintenacne;
            mContext = Database;
        }

        [Route("TestController/{UserID}")]
        [HttpPost]
        public async Task<IHttpActionResult> CreateJob(int UserID)
        {
            var data =await mContext.Set<AchievementStatistic>().Where(u => u.UserID == UserID).SingleOrDefaultAsync();
            return Ok(data);    
        }
    }
}