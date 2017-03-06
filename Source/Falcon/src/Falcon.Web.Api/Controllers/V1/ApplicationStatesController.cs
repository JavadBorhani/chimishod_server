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
        private readonly IWebUserSession mUserSession;

        public ApplicationStatesController(IMapper Mapper , IDbContext Database , IWebUserSession UserSession)
        {
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
        }

        [ResponseType(typeof(SApplicationState))]
        [Route("ApplicationStates/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetApplicationStates()
        {   
            var dbApplicationState = await mDb.Set<ApplicationState>().SingleOrDefaultAsync();
            var clientResult = mMapper.Map<ApplicationState , SApplicationState> (dbApplicationState);
            return Ok(clientResult);
        }
        
    }
}