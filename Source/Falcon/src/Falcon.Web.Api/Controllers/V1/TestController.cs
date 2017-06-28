using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Utilities;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Common.Memmory;
using System;
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
        private readonly IMemoryStore mStore;

        public TestController(IDbContext Database , IUserQueryProcessor User , IMemoryStore Store)
        {
            mDb = Database;
            mUser = User;
            mStore = Store;
        }

        [Route("TestController")]
        [HttpPost]
        public IHttpActionResult CreateJob()
        {
            return Ok();
        }
    }
}