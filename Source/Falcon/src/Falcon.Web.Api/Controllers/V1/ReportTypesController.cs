// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Collections.Generic;
using System.Data.Entity;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class ReportTypesController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;

        public ReportTypesController(IMapper Mapper, IDbContext Database , IWebUserSession UserSession)
        {
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
        }

        [ResponseType(typeof(SReportType))]
        [Route("v2/ReportTypes/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetReportTypes()
        {

            var reportTypes = await mDb.Set<ReportType>().ToListAsync();
            var result = mMapper.Map<List<ReportType>, List<SReportType>>(reportTypes);

            return Response(HttpStatusCode.OK, result);
        }
    }
}