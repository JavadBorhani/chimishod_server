// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class ReportedQuestionsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public ReportedQuestionsController(IDateTime DateTime, IDbContext Database)
        {
            mDateTime = DateTime;
            mDb = Database;
        }


        [Route("ReportedQuestions/{UUID}/{QuestionID}/{ReportID}")] //TODO Refactor this to packet
        [HttpPost]
        public async Task<IHttpActionResult> ReportQuestion(string UUID , int QuestionID , int ReportID)
        {
            var userID = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                var reportExists = await mDb.Set<ReportedQuestion>().Where(rq => rq.UserID == userID && rq.QuestionID == QuestionID).Select(rq => rq.ID).SingleOrDefaultAsync();
                var questionIDExists = await mDb.Set<Question>().CountAsync( q=> q.ID == QuestionID) > 0;
                var reportIDExists = await mDb.Set<ReportType>().CountAsync(rt => rt.ID == ReportID) > 0;

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
                        mDb.Set<ReportedQuestion>().Add(newReport);
                        await mDb.SaveChangesAsync();

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
    }
}