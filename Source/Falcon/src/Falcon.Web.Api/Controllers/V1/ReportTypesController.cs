using System.Linq;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;
using System.Web.Http.Description;
using System.Data.Entity;
using System.Web.Http.Results;
using System.Net;
using System.Net.Http;
using Falcon.Web.Models.Api;
using AutoMapper;
using System.Collections.Generic;

namespace Falcon.Web.Api.Controllers.V1
{
    public class ReportTypesController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IMapper mMapper;

        public ReportTypesController(IMapper Mapper)
        {
            mMapper = Mapper;
        }

        [ResponseType(typeof(SReportType))]
        [Route("ReportTypes/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetReportTypes(string UUID)
        {
            var userID = await db.Users.Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                var reportTypes = await db.ReportTypes.ToListAsync();
                var result = mMapper.Map<List<ReportType>, List<SReportType>>(reportTypes);

                return Response(HttpStatusCode.OK, result);
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

        private bool ReportTypeExists(int id)
        {
            return db.ReportTypes.Count(e => e.ID == id) > 0;
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