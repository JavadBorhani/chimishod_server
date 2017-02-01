using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
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
    public class QuestionBoostsController : ApiController
    {
        private DbEntity db = new DbEntity();
        private readonly IMapper mMapper;

        public QuestionBoostsController(IMapper Mapper)
        {
            mMapper = Mapper;
        }
       
        [ResponseType(typeof(Models.Api.SQuestionBoost))]
        [Route("QuestionBoosts/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetQuestionBoostList(string UUID)
        {
            var user = await db.Users.Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();

            if(user != 0)
            {
                var dbBoostList = await db.QuestionBoosts.ToListAsync();

                if(dbBoostList.Count > 0 )
                {
                    var clientBoostLists = mMapper.Map<List<QuestionBoost>, List<SQuestionBoost>>(dbBoostList);
                    return Ok(clientBoostLists);
                }
                return ReturnResponse(HttpStatusCode.NoContent);
            }
            else
            {
                return ReturnResponse(HttpStatusCode.Unauthorized);
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

        private bool QuestionBoostExists(int id)
        {
            return db.QuestionBoosts.Count(e => e.ID == id) > 0;
        }

        private ResponseMessageResult ReturnResponse(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }
    }
}