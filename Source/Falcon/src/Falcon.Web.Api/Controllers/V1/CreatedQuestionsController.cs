using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Common;

namespace Falcon.Web.Api.App_Start
{
    [UnitOfWorkActionFilter]
    public class CreatedQuestionsController : ApiController
    {
        private DbEntity db = new DbEntity();

        // POST: api/CreatedQuestions
        [ResponseType(typeof(CreatedQuestion))]
        [HttpPost]
        public async Task<IHttpActionResult> PostCreatedQuestion(CreatedQuestion createdQuestion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.CreatedQuestions.Add(createdQuestion);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = createdQuestion.ID }, createdQuestion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CreatedQuestionExists(int id)
        {
            return db.CreatedQuestions.Count(e => e.ID == id) > 0;
        }
    }
}