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
    public class QuestionBoostsController : ApiController
    {
        private DbEntity db = new DbEntity();

       
        [ResponseType(typeof())]
        [Route("QuestionBoosts"))]
        [HttpPost]
        public async Task<IHttpActionResult> GetQuestionBoostList(string UUID)
        {

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool QuestionBoostExists(int id)
        {
            return db.QuestionBoosts.Count(e => e.ID == id) > 0;
        }
    }
}