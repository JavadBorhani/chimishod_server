﻿using System;
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
    public class AnswersController : ApiController
    {
        private DBEntity db = new DBEntity();
        private IDateTime mDateTime;

        public AnswersController(IDateTime dateTime)
        {
            mDateTime = dateTime;
        }

        // GET: api/Answers
        public IQueryable<Answer> GetAnswers()
        {
            return db.Answers;
        }

        // GET: api/Answers/5
        [ResponseType(typeof(Answer))]
        public async Task<IHttpActionResult> GetAnswer(int id)
        {
            Answer answer = await db.Answers.FindAsync(id);
            if (answer == null)
            {
                return NotFound();
            }

            var result = new Models.Api.Answer
            {
                UserID = answer.UserID,
                QuestionID = answer.QuestionID,
                Dislike = answer.Dislike,
                Liked = answer.Liked,
                YesNoState = answer.YesNoState,
                CreatedDate = answer.CreatedDate,
            };
            return Ok(result);
        }

        // PUT: api/Answers/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAnswer(int id, Answer answer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != answer.ID)
            {
                return BadRequest();
            }

            db.Entry(answer).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AnswerExists(id))
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

        [Route("Answers/Answer/{UUID}")]
        [ResponseType(typeof(Models.Api.Answer))]
        [HttpPost]
        public async Task<IHttpActionResult> PostingAnswer(string UUID, [FromBody] Models.Api.Answer answer)
        {
            var user = db.Users.SingleOrDefault(u => u.UUID == UUID);
            if(user != null)
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                if(AnswerExists(user.ID , answer.QuestionID))
                {
                    return ResponseMessage(Request.CreateResponse(HttpStatusCode.BadRequest));
                }

                var newAnswer = new Answer
                {
                    QuestionID = answer.QuestionID,
                    UserID = user.ID,
                    YesNoState = answer.YesNoState,
                    Liked = answer.Liked,
                    Dislike = answer.Dislike,
                    CreatedDate = mDateTime.Now
                };

                db.Answers.Add(newAnswer);
                await db.SaveChangesAsync();

                var questionToUpdate = db.Questions.Find(answer.QuestionID);
                if(questionToUpdate != null)
                {
                    if(answer.YesNoState)
                    {
                        ++questionToUpdate.Yes_Count;
                    }
                    else
                    {
                        ++questionToUpdate.No_Count;
                    }
                    if(answer.Liked != null)
                    {
                        ++questionToUpdate.Like_Count;
                    }
                    else if(answer.Dislike != null)
                    {
                        ++questionToUpdate.Dislike_Count;
                    }
                    await db.SaveChangesAsync();
                }
                return Ok();
            }
            return NotFound();
        }

        // DELETE: api/Answers/5
        [ResponseType(typeof(Answer))]
        public async Task<IHttpActionResult> DeleteAnswer(int id)
        {
            Answer answer = await db.Answers.FindAsync(id);
            if (answer == null)
            {
                return NotFound();
            }

            db.Answers.Remove(answer);
            await db.SaveChangesAsync();

            return Ok(answer);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AnswerExists(int id)
        {
            return db.Answers.Count(e => e.ID == id) > 0;
        }
        private bool AnswerExists(int userID , int questionID)
        {
            return db.Answers.Count(e => e.UserID == userID && e.QuestionID == questionID) > 0;
        }

    }
}