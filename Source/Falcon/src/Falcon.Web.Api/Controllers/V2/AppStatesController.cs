using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Config;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class AppStatesController : FalconApiController
    {
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;
        private readonly IGlobalApplicationState mAppState;
        private readonly IClientApplicationState mClientState;

        public AppStatesController(IMapper Mapper, IDbContext Database, IGlobalApplicationState AppState , IClientApplicationState ClientState)
        {
            mMapper = Mapper;
            mDb = Database;
            mAppState = AppState;
            mClientState = ClientState;
        }

        [ResponseType(typeof(SClientAppState))]
        [Route("v2/ApplicationStates/")]
        [HttpPost]
        public IHttpActionResult GetApplicationStates()
        {
            var clientResult = mMapper.Map<SApplicationState, SClientAppState>(mAppState.GetState());
            return Ok(clientResult);
        }

        [ResponseType(typeof(SClientAppState))]
        [Route("v2/ApplicationStates/Refresh/")]
        [HttpGet]
        public IHttpActionResult RefreshAppState()
        {
            mAppState.ReadStateFromDatabase();
            return Ok();
        }

        [ResponseType(typeof(SClientAppState))]
        [Route("v2/ApplicationStates/Set/")]
        [HttpPost]
        public IHttpActionResult SetAppState([FromBody] SApplicationState NewAppState)
        {
            if (ModelState.IsValid)
            {
                mAppState.SetState(NewAppState);
                return Ok();
            }
            else
            {
                return Response(System.Net.HttpStatusCode.BadRequest);
            }
        }


        [ResponseType(typeof(SClientAppState))]
        [Route("v2/AppStates/Version/")]
        [HttpGet]
        public SClientVersionInfo GetClientVersionInfo()
        {
            var clientConfig = mClientState.State();
            return mMapper.Map<SClientVersionInfo>(clientConfig);
        }

    }
}
