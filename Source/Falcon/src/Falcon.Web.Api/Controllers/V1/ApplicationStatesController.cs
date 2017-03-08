// Flapp Copyright 2017-2018

using System.Web.Http;
using AutoMapper;
using System.Web.Http.Description;
using Falcon.Web.Models.Api;
using Falcon.EFCommonContext;
using Falcon.Web.Common;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class ApplicationStatesController : FalconApiController
    {
        
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;
        private readonly IGlobalApplicationState mAppState;

        public ApplicationStatesController(IMapper Mapper , IDbContext Database , IGlobalApplicationState AppState)
        {
            mMapper = Mapper;
            mDb = Database;
            mAppState = AppState;
        }

        [ResponseType(typeof(ClientAppState))]
        [Route("ApplicationStates/")]
        [HttpPost]
        public IHttpActionResult GetApplicationStates()
        {   
            var clientResult = mMapper.Map<SApplicationState , ClientAppState> (mAppState.State());
            return Ok(clientResult);
        }

        [ResponseType(typeof(ClientAppState))]
        [Route("ApplicationStates/Refresh/")]
        [HttpGet]
        public IHttpActionResult RefreshAppState()
        {
            mAppState.ReadStateFromDatabase();
            return Ok();
        }

        [ResponseType(typeof(ClientAppState))]
        [Route("ApplicationStates/Set/")]
        [HttpPost]
        public IHttpActionResult SetAppState([FromBody] SApplicationState NewAppState)
        {
            if(ModelState.IsValid)
            {
                mAppState.SetState(NewAppState);
                return Ok();
            }
            else
            {
                return Response(System.Net.HttpStatusCode.BadRequest);
            }
        }
    }
}