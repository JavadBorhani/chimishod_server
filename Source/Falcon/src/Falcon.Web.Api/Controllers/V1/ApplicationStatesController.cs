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
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class ApplicationStatesController : FalconApiController
    {
        
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;
        private readonly SApplicationState mAppState;

        public ApplicationStatesController(IMapper Mapper , IDbContext Database , IGlobalApplicationState AppState)
        {
            mMapper = Mapper;
            mDb = Database;
            mAppState = AppState.State();
        }

        [ResponseType(typeof(ClientAppState))]
        [Route("ApplicationStates/")]
        [HttpPost]
        public IHttpActionResult GetApplicationStates()
        {   
            var clientResult = mMapper.Map<SApplicationState , ClientAppState> (mAppState);
            return Ok(clientResult);
        }
        
    }
}