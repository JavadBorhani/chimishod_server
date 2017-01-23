using System.Data;
using System.Data.Entity;
using System.Linq;
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
        public  async Task<IHttpActionResult> GettingQuestion(string uuid)
        {
            var user = db.Users.SingleOrDefault(u => u.UUID == uuid);
            
            if(user != null)
            { 
                
                var result =  await db.Questions.Where(question => question.Banned == false && !db.Answers 
                                        .Where( answer => answer.UserID == user.ID)
                                        .Select(y => y.QuestionID)
                                        .ToList().Contains(question.ID))
                                        .OrderByDescending(question => question.Weight).Take(Constants.DefaultReturnAmounts.Question).ToArrayAsync();

                if (result.Length > 0)
                {
                    Models.Api.Question[] questions = new Models.Api.Question[result.Length];
                    for (int i = 0; i < questions.Length; ++i)
                    {
                        questions[i] = new Models.Api.Question
                        {
                            ID = result[i].ID,
                            What_if = result[i].What_if,
                            But = result[i].But,
                            Catgory_ID = result[i].Catgory_ID,
                            Yes_Count = result[i].Yes_Count,
                            No_Count = result[i].No_Count,
                            Like_Count = result[i].Like_Count,
                            Dislike_Count = result[i].Dislike_Count,
                            Weight = result[i].Weight,
                            CreatorID = result[i].CreatorID,
                            CreatedDate = result[i].CreatedDate,
                            UpdateDate = result[i].UpdateDate,
                            Banned = result[i].Banned
                        };
                    }
                    return Ok(questions);
                }

                Models.Api.Question[] noQuestion = new Models.Api.Question[Constants.DefaultReturnAmounts.Question];
                for (int i = 0; i < Constants.DefaultReturnAmounts.Question; ++i)
                {
                    noQuestion[i] = new Models.Api.Question
                    {
                        ID = Constants.DefaultValues.NoQuestionID,
                        What_if = Constants.DefaultValues.NoQuestionWhat,
                        But = Constants.DefaultValues.NoQuestionBut
                    };
                }
                return Ok(noQuestion);
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