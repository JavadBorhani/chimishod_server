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

namespace Falcon.Web.Api.Controllers.V1
{
    public class UserAvatarsController : ApiController
    {
        private DbEntity db = new DbEntity();

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserAvatarExists(int id)
        {
            return db.UserAvatars.Count(e => e.ID == id) > 0;
        }
    }
}