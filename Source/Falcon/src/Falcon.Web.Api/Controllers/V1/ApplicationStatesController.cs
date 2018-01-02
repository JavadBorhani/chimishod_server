// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;

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

        //[ResponseType(typeof(ClientAppState))]
        //[Route("v1/ApplicationStates/")]
        //[HttpPost]
        //public IHttpActionResult GetApplicationStates()
        //{   
        //    var clientResult = mMapper.Map<SApplicationState , ClientAppState> (mAppState.GetState());
        //    return Ok(clientResult);
        //}

        //[ResponseType(typeof(ClientAppState))]
        //[Route("v1/ApplicationStates/Refresh/")]
        //[HttpGet]
        //public IHttpActionResult RefreshAppState()
        //{
        //    mAppState.ReadStateFromDatabase();
        //    return Ok();
        //}

        //[ResponseType(typeof(ClientAppState))]
        //[Route("v1/ApplicationStates/Set/")]
        //[HttpPost]
        //public IHttpActionResult SetAppState([FromBody] SApplicationState NewAppState)
        //{
        //    if(ModelState.IsValid)
        //    {
        //        mAppState.SetState(NewAppState);
        //        return Ok();
        //    }
        //    else
        //    {
        //        return Response(System.Net.HttpStatusCode.BadRequest);
        //    }
        //}
    }
}