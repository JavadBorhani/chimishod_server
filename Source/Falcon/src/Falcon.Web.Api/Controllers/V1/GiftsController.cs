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
using Falcon.Web.Common;
using Falcon.EFCommonContext;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class GiftsController : FalconApiController
    {
        private readonly IDbContext mDb;

        public GiftsController(IDbContext Database)
        {
            mDb = Database;
        }
    }
}