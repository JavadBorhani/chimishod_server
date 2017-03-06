// Flapp Copyright 2017-2018

using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class GiftsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;

        public GiftsController(IDbContext Database , IWebUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
    }
}