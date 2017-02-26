using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Utilities.Extentions;
using Falcon.Web.Models.Api;
using AutoMapper;

namespace Falcon.Web.Api.Controllers.V1
{
    public class LevelsController : FalconApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IMapper mMapper;
        public LevelsController(IMapper Mapper)
        {
            mMapper = Mapper;
        }

        [ResponseType(typeof(SLevel))]
        [Route("Levels/{UUID}/{LevelNumber}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetLevelInfo(string UUID , int LevelNumber)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(a => a.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                if(LevelNumber >= 0 )
                {
                    var levelinfo = await db.Levels.AsNoTracking().Where(l => l.LevelNumber == LevelNumber).SingleOrDefaultAsync();

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
            return Response(HttpStatusCode.Unauthorized);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LevelExists(int id)
        {
            return db.Levels.Count(e => e.ID == id) > 0;
        }
    }
}