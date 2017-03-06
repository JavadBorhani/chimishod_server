// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using AutoMapper;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class LevelsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;

        public LevelsController(IMapper Mapper, IDbContext Database , IWebUserSession UserSession)
        {
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
        }

        [ResponseType(typeof(SLevel))]
        [Route("Levels/{LevelNumber}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetLevelInfo(int LevelNumber)
        {
            if(LevelNumber >= 0 )
            {
                var levelinfo = await mDb.Set<Level>().AsNoTracking().Where(l => l.LevelNumber == LevelNumber).SingleOrDefaultAsync();

                if(levelinfo != null)
                {
                    return Response(HttpStatusCode.OK, mMapper.Map<Level, SLevel>(levelinfo));
                }
                else
                {
                    return Response(HttpStatusCode.NotFound);
                }
            }
            else
            {
                return Response(HttpStatusCode.NotAcceptable);
            }            
        }
    }
}