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
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class ReportTypesController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IWebUserSession mUserSession;

        private readonly IGlobalApplicationState mAppState;

        public ReportTypesController(IMapper Mapper, IDbContext Database , IWebUserSession UserSession , IGlobalApplicationState AppState)
        {
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState;
        }

        [ResponseType(typeof(SReportType))]
        [Route("ReportTypes/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetReportTypes()
        {
            int value = mAppState.GetState().AnswerPrize;

            var reportTypes = await mDb.Set<ReportType>().ToListAsync();
            var result = mMapper.Map<List<ReportType>, List<SReportType>>(reportTypes);

            return Response(HttpStatusCode.OK, result);
        }
    }
}