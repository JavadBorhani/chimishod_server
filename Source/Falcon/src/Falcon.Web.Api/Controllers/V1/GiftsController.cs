// Flapp Copyright 2017-2018

using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;

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