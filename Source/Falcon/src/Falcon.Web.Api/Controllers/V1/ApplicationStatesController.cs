// Flapp Copyright 2017-2018

using System.Linq;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Net;
using System.Web.Http.Description;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;
using Falcon.Web.Common;
using Falcon.Web.Api.Utilities.Base;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class ApplicationStatesController : FalconApiController
    {
        
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;

        public ApplicationStatesController(IMapper Mapper , IDbContext Database)
        {
            mMapper = Mapper;
            mDb = Database;
        }

        [ResponseType(typeof(SApplicationState))]
        [Route("ApplicationStates/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetApplicationStates(string UUID)
        {
            var user = await  mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(user != 0) // user exists
            {
                var dbApplicationState = await mDb.Set<ApplicationState>().SingleOrDefaultAsync();
                var clientResult = mMapper.Map<ApplicationState , SApplicationState> (dbApplicationState);
                return Ok(clientResult);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }
        
    }
}