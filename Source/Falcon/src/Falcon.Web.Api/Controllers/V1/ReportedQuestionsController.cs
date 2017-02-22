using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using System.Web.Http.Results;
using Falcon.Web.Api.Utilities.Extentions;

namespace Falcon.Web.Api.Controllers.V1
{
    public class ReportedQuestionsController : FalconApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IDateTime mDateTime;

        public ReportedQuestionsController(IDateTime DateTime)
        {
            mDateTime = DateTime;
        }


        [Route("ReportedQuestions/{UUID}/{QuestionID}/{ReportID}")] //TODO Refactor this to packet
        [HttpPost]
        public async Task<IHttpActionResult> ReportQuestion(string UUID , int QuestionID , int ReportID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                var reportExists = await db.ReportedQuestions.Where(rq => rq.UserID == userID && rq.QuestionID == QuestionID).Select(rq => rq.ID).SingleOrDefaultAsync();
                var questionIDExists = await db.Questions.CountAsync( q=> q.ID == QuestionID) > 0;
                var reportIDExists = await db.ReportTypes.CountAsync(rt => rt.ID == ReportID) > 0;

                if (reportExists == 0)
                {
                    if (questionIDExists && reportIDExists)
                    {
                        var newReport = new ReportedQuestion
                        {
                            QuestionID = QuestionID,
                            UserID = userID,
                            ReportTypeID = ReportID,
                            CreatedDate = mDateTime.Now
                        };
                        db.ReportedQuestions.Add(newReport);
                        await db.SaveChangesAsync();

                        return Response(HttpStatusCode.OK);
                    }
                    else
                    {
                        return Response(HttpStatusCode.Unauthorized);
                    }
                }
                else
                {
                    return Response(HttpStatusCode.Conflict);
                }
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
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

        private bool ReportedQuestionExists(int id)
        {
            return db.ReportedQuestions.Count(e => e.ID == id) > 0;
        }
    }
}