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
    public class CommentsController : ApiController
    {
        private DBEntity db = new DBEntity();

        private readonly IDateTime mDateTime;

        public CommentsController(IDateTime dateTime)
        {
            mDateTime = dateTime;
        }

        [Route("Comments/{UUID}/{QuestionID}")]
        [HttpGet]
        public async Task<IHttpActionResult> GettingComments(string UUID , int QuestionID)
        {
            var user = db.Users.SingleOrDefault(u => u.UUID == UUID);
            if(user != null)
            {
                var result = await db.Comments.AsNoTracking()
                                        .Where(comment => comment.QuestionID == QuestionID && comment.IsVerified == true)
                                        .Take(Constants.DefaultReturnAmounts.Comment).ToArrayAsync();

                Models.Api.Comment[] commentList = new Models.Api.Comment[result.Length];

                for (int i = 0; i < commentList.Length; ++i)
                {
                    commentList[i] = new Models.Api.Comment
                    {
                        UserName = result[i].User.UserName,
                        Content = result[i].Comment1,
                        Response = result[i].Response,
                        InsertDate = result[i].InsertDate
                    };
                }

                return Ok(commentList);
            }

            return NotFound();
        }

        [ResponseType(typeof(Models.Api.Comment))]
        [Route("Comments/{UUID}/{QuestionID}")]
        [HttpPost]
        public async Task<IHttpActionResult> PostingComment(string UUID , int QuestionID , [FromBody] Models.Api.Comment NewComment)
        {
           
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            var question = await db.Questions.FindAsync(QuestionID);

            if(user != null || question != null)
            {
                var comment = new Comment
                {
                   UserID = user.ID,
                   QuestionID = question.ID,
                   Comment1 = NewComment.Content,
                   Response = null,
                   IsVerified = false,
                   InsertDate = mDateTime.Now
                };

                db.Comments.Add(comment);
                await db.SaveChangesAsync();
                return Ok();
            }
            else
            {
                return NotFound();
            }
        }

        //// GET: api/Comments/5
        //[ResponseType(typeof(Comment))]
        //public async Task<IHttpActionResult> GetComment(int id)
        //{
        //    Comment comment = await db.Comments.FindAsync(id);
        //    if (comment == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(comment);
        //}

        //// PUT: api/Comments/5
        //[ResponseType(typeof(void))]
        //public async Task<IHttpActionResult> PutComment(int id, Comment comment)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    if (id != comment.ID)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(comment).State = EntityState.Modified;

        //    try
        //    {
        //        await db.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!CommentExists(id))
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

        //DELETE: api/Comments/5
        //[ResponseType(typeof(Comment))]
        //public async Task<IHttpActionResult> DeleteComment(int id)
        //{
        //    Comment comment = await db.Comments.FindAsync(id);
        //    if (comment == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Comments.Remove(comment);
        //    await db.SaveChangesAsync();

        //    return Ok(comment);
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CommentExists(int id)
        {
            return db.Comments.Count(e => e.ID == id) > 0;
        }
    }
}