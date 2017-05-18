using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers
{
    [UnitOfWorkActionFilter]
    public class RDController : FalconApiController
    {
        private readonly IDbContext mDb;
        public RDController(IDbContext Database)
        {
            mDb = Database;
        }

        [Route("Ranking/Calc")]
        [HttpGet]
        public async Task<IHttpActionResult> RankCalculation()
        {
            var result = await mDb.Set<User>().SingleOrDefaultAsync(u => u.ID == 1);
            result.Score += 10;
            

        }
    }
}
