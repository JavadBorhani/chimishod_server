using Falcon.Common;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class SampleController : ApiController
    {
        private readonly IDateTime mDateTime;
        private readonly IDbContext mDbContext;

        public SampleController(IDbContext Context, IDateTime dateTime)
        {
            mDateTime = dateTime;
            mDbContext = Context;
        }

        [ResponseType(typeof(Models.Api.User))]
        [Route("UserAuthenticator/{UUID}")]
        [HttpGet]
        public IHttpActionResult CheckDatabase(string UUID)
        {
            var level = new Level
            {
                Star = 20,
                Avatar = "nothing",
                TotalQuestion = 20,
                CreatedDate = mDateTime.Now,
                UpdatedDate = mDateTime.Now,
            };

            mDbContext.Set<Level>().Add(level);
            mDbContext.Set<Level>().Add(level);
            mDbContext.Set<Level>().Add(level);
            mDbContext.SaveChanges();
            mDbContext.Set<Level>().Add(level);
            mDbContext.Set<Level>().Add(level);
            mDbContext.Set<Level>().Add(level);
            throw new Exception("just for fun");
        }

    }
}
