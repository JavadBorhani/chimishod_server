using System.Linq;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Web.Http.Results;
using System.Net.Http;
using System.Net;
using System.Web.Http.Description;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.Controllers.V1
{
    public class ApplicationStatesController : ApiController
    {
        private DbEntity db = new DbEntity();
        private readonly IMapper mMapper;

        public ApplicationStatesController(IMapper Mapper)
        {
            mMapper = Mapper;
        }

        [ResponseType(typeof(SApplicationState))]
        [Route("ApplicationStates/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetApplicationStates(string UUID)
        {
            var user = await  db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(user != 0) // user exists
            {
                var dbApplicationState = await db.ApplicationStates.SingleOrDefaultAsync();
                var clientResult = mMapper.Map<ApplicationState , SApplicationState> (dbApplicationState);
                return Ok(clientResult);
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

        private bool ApplicationStateExists(int id)
        {
            return db.ApplicationStates.Count(e => e.ID == id) > 0;
        }

        private ResponseMessageResult ReturnResponse(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }
    }
}