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
using AutoMapper;
using Falcon.Web.Models.Api;
using System.Web.Http.Results;

namespace Falcon.Web.Api.Controllers.V1
{
    public class AchievedPosessionsController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IMapper mMapper;

        public AchievedPosessionsController(IMapper Mapper)
        {
            mMapper = Mapper;
        }

        [Route("/Achievments/{UUID}")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievementList(string UUID)
        {
            var user = await db.Users.Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(user != 0) // user Exists
            {
                // Finding Level , Query , QueryType , Based on query type choosing
                // Todo Getting List of achievements separating based on QueryType
                // 
                return null;
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AchievedPosessionExists(int id)
        {
            return db.AchievedPosessions.Count(e => e.ID == id) > 0;
        }

        private ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }
        private ResponseMessageResult Response(HttpStatusCode Code, object DataToSend)
        {
            return ResponseMessage(Request.CreateResponse(Code, DataToSend));
        }
    }
}