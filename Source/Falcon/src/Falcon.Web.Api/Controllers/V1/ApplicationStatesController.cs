// Flapp Copyright 2017-2018

using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Web.Http.Description;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;
using Falcon.Web.Common;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;

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

        [ResponseType(typeof(ClientAppState))]
        [Route("ApplicationStates/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetApplicationStates()
        {   
            var dbApplicationState = await mDb.Set<ApplicationState>().AsNoTracking().SingleOrDefaultAsync();
            var clientResult = mMapper.Map<ApplicationState , ClientAppState> (dbApplicationState);
            return Ok(clientResult);
        }
        
    }
}