using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;

namespace Falcon.Web.Api.Controllers.V1
{
    public class CommentsController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IDateTime mDateTime;

        public CommentsController(IDateTime dateTime)
        {
            mDateTime = dateTime;
        }

        [Route("Comments/{UUID}/{QuestionID}")]
        [HttpGet]
        public async Task<IHttpActionResult> GettingComments(string UUID , int QuestionID)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            if(user != null)
            {
                var result = await db.Comments.AsNoTracking()
                                        .Where(comment => comment.QuestionID == QuestionID && comment.IsVerified == true)
                                        .Take(Constants.DefaultReturnAmounts.Comment).ToArrayAsync();

                if (result.Length > 0)
                { 
                    Models.Api.SComment[] commentList = new Models.Api.SComment[result.Length];

                    for (int i = 0; i < commentList.Length; ++i)
                    {
                        commentList[i] = new Models.Api.SComment
                        {
                            UserName = result[i].User.UserName,
                            Content = result[i].CommentContent,
                            Response = result[i].Response,
                            InsertDate = result[i].InsertDate
                        };
                    }
                    return Ok(commentList);
                }
                return Ok();
            }
            return NotFound();
        }

        [ResponseType(typeof(Models.Api.SComment))]
        [Route("Comments/{UUID}/{QuestionID}")]
        [HttpPost]
        public async Task<IHttpActionResult> PostingComment(string UUID , int QuestionID , [FromBody] Models.Api.SComment NewComment)
        {
           
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);
            var question = await db.Questions.FindAsync(QuestionID);

            if(user != null && question != null)
            {
                var comment = new Comment
                {
                   UserID = user.ID,
                   QuestionID = question.ID,
                   CommentContent = NewComment.Content,
                   Response = Constants.DefaultValues.CommentDefaultReponseMessage,
                   IsVerified = Constants.DefaultValues.CommentDefaultVerify,
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
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private async Task<bool> CommentExists(int id)
        {
            return await db.Comments.CountAsync(e => e.ID == id) > 0;
        }
    }
}