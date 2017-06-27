using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IUserQueryProcessor mUser;

        public TestController(IDbContext Database , IUserQueryProcessor User)
        {
            mDb = Database;
            mUser = User;
        }

        [Route("TestController")]
        [HttpPost]
        public async Task<IHttpActionResult> CreateJob()
        {
            var value = await mUser.IncreaseCoin(10);
            return Ok(value);
        }
    }
}