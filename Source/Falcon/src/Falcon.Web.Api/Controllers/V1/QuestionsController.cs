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
using Falcon.Database;

namespace Falcon.Web.Api.Controllers.V1
{
    public class QuestionsController : ApiController
    {
        private DBEntity db = new DBEntity();


        // GET: api/Questions/5
        [ResponseType(typeof(Models.Question))]
        [Route("Questions/Question/{UUID}")]
        [HttpGet]
        public  IHttpActionResult GettingQuestion(string uuid)
        {
            var userID = db.Users.SingleOrDefault(u => u.UUID == uuid).ID;            
            var result = db.Questions.Where(question => !db.Answers
                                    .Where( answer => answer.UserID == userID)
                                    .Select(y => y.ID)
                                    .ToList().Contains(question.ID))
                                    .Where(question => question.Banned == false)
                                    .OrderByDescending(question => question.Weight).Take(1).ToList();
            

            return Ok(result);
        }

        // PUT: api/Questions/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutQuestion(int id, Models.Question question)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != question.ID)
            {
                return BadRequest();
            }

            db.Entry(question).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuestionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Questions
        //[ResponseType(typeof(Question))]
        //public async Task<IHttpActionResult> PostQuestion(Models.Question question)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    db.Questions.Add(question);

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateException)
        //    {
        //        if (QuestionExists(question.ID))
        //        {
        //            return Conflict();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return CreatedAtRoute("DefaultApi", new { id = question.ID }, question);
        //}

        // DELETE: api/Questions/5
        [ResponseType(typeof(Models.Question))]
        public async Task<IHttpActionResult> DeleteQuestion(int id)
        {
            Question question = await db.Questions.FindAsync(id);
            if (question == null)
            {
                return NotFound();
            }

            db.Questions.Remove(question);
            await db.SaveChangesAsync();

            return Ok(question);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool QuestionExists(int id)
        {
            return db.Questions.Count(e => e.ID == id) > 0;
        }
    }
}