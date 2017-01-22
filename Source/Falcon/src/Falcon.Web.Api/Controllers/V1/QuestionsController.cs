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
using Falcon.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    public class QuestionsController : ApiController
    {
        private DBEntity db = new DBEntity();


        [ResponseType(typeof(Models.Api.Question))]
        [Route("Questions/Question/{UUID}")]
        [HttpGet]
        public  IHttpActionResult GettingQuestion(string uuid)
        {
            var user = db.Users.SingleOrDefault(u => u.UUID == uuid);            
            
            if(user != null)
            { 
                var result = db.Questions.Where(question => question.Banned == false && !db.Answers 
                                        .Where( answer => answer.UserID == user.ID)
                                        .Select(y => y.ID)
                                        .ToList().Contains(question.ID))
                                        .OrderByDescending(question => question.Weight).Take(Constants.DefaultReturnAmounts.Question).SingleOrDefault();


                var questionModel = new Models.Api.Question
                {
                    ID = result.ID,
                    What_if = result.What_if,
                    But = result.But,
                    Catgory_ID = result.Catgory_ID,
                    Yes_Count = result.Yes_Count ,
                    No_Count = result.No_Count,
                    Like_Count = result.Like_Count,
                    Dislike_Count = result.Dislike_Count,
                    Weight = result.Weight,
                    CreatorID = result.CreatorID,
                    CreatedDate = result.CreatedDate,
                    UpdateDate = result.UpdateDate,
                    Banned = result.Banned
                };
                return Ok(questionModel);
            }
            return NotFound();
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        // PUT: api/Questions/5
        //[ResponseType(typeof(void))]
        //public async Task<IHttpActionResult> PutQuestion(int id, Models.Api.Question question)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    if (id != question.ID)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(question).State = EntityState.Modified;

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!QuestionExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return StatusCode(HttpStatusCode.NoContent);
        //}



        //private bool QuestionExists(int id)
        //{
        //    return db.Questions.Count(e => e.ID == id) > 0;
        //}

        //// POST: api/Questions
        //[ResponseType(typeof(Question))]
        //public async Task<IHttpActionResult> PostQuestion(Models.Api.Question question)
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

        //// DELETE: api/Questions/5
        //[ResponseType(typeof(Models.Api.Question))]
        //public async Task<IHttpActionResult> DeleteQuestion(int id)
        //{
        //    Question question = await db.Questions.FindAsync(id);
        //    if (question == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Questions.Remove(question);
        //    await db.SaveChangesAsync();

        //    return Ok(question);
        //}

    }
}