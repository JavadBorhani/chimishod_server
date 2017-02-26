// Flapp Copyright 2017-2018

using System.Linq;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;
using System.Web.Http.Description;
using System.Data.Entity;
using System.Net;
using Falcon.Web.Models.Api;
using AutoMapper;
using System.Collections.Generic;
using Falcon.Web.Api.Utilities.Extentions;
using Falcon.Web.Common;
using Falcon.EFCommonContext;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class ReportTypesController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;

        public ReportTypesController(IMapper Mapper, IDbContext Database)
        {
            mMapper = Mapper;
            mDb = Database;
        }

        [ResponseType(typeof(SReportType))]
        [Route("ReportTypes/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetReportTypes(string UUID)
        {
            var userID = await mDb.Set<User>().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                var reportTypes = await mDb.Set<ReportType>().ToListAsync();
                var result = mMapper.Map<List<ReportType>, List<SReportType>>(reportTypes);

                return Response(HttpStatusCode.OK, result);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }
    }
}