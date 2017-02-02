using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.Common.Logging;
using log4net;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using Falcon.Web.Models.Api;
using System.Web.Http.Results;

namespace Falcon.Web.Api.Controllers.V1
{
    public class AnswersController : ApiController
    {
        private DbEntity db = new DbEntity();
        private readonly IDateTime mDateTime;
        private readonly ILog mLogManager;
        private readonly IMapper mMapper;

        public AnswersController(IDateTime dateTime , ILogManager logManager , IMapper Mapper)
        {
            mDateTime = dateTime;
            mLogManager = logManager.GetLog(typeof(AnswersController));
            mMapper = Mapper;
        }

        public IQueryable<Answer> GetAnswers()
        {
            return db.Answers;
        }

        [ResponseType(typeof(Models.Api.SAnswer))]
        public async Task<IHttpActionResult> GetAnswer(int id)
        {
            Answer answer = await db.Answers.FindAsync(id);
            if (answer == null)
            {
                return NotFound();
            }
            var result = new Models.Api.SAnswer
            {
                UserID = answer.UserID,
                QuestionID = answer.QuestionID,
                Dislike = answer.Dislike,
                Liked = answer.Liked,
                YesNoState = answer.YesNoState,
                CreatedDate = answer.CreatedDate,
                IsFavorited = true
            };
            return Ok(result);
        }

        [HttpPost]
        [Route("Statistics/{UUID}")]
        [ResponseType(typeof(SUserStatistics))]
        public async Task<IHttpActionResult> GetStatistics(string UUID)
        {
            var userID = await  db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();

            if(userID != 0)
            {
                int userTotalYes = 0;
                int userTotalNo = 0;
                float userNormal = 0;
                // QuestionID YESCount NoCount
                var userAndQuestion = await db.Answers.AsNoTracking()
                                                    .Where( u => u.UserID == userID)
                                                    .Select( u => new { u.YesNoState, u.Question.Yes_Count , u.Question.No_Count, u.Question.Banned }).ToArrayAsync(); 
                
                if(userAndQuestion.Length >  0 )
                {
                    for (int i = 0; i < userAndQuestion.Length; ++i)
                    {
                        if (userAndQuestion[i].Banned == false)
                        {
                            userTotalYes = (userAndQuestion[i].YesNoState == true) ? (++userTotalYes) : userTotalYes;
                            userTotalNo = (userAndQuestion[i].YesNoState == false) ? (++userTotalNo) : userTotalNo;
                            var total = 1;
                            total = userAndQuestion[i].Yes_Count + userAndQuestion[i].No_Count;
                            var yesPercent = userAndQuestion[i].Yes_Count * 100.0f / total;
                            var noPercent = userAndQuestion[i].No_Count * 100.0f / total;
                            userNormal += ((userAndQuestion[i].YesNoState == true) ? yesPercent : noPercent);
                        }
                    }
                    userNormal = userNormal / userAndQuestion.Length;
                }
                SUserStatistics m = new SUserStatistics
                {
                    UserNormal = userTotalYes,
                    UserTotalNo = userTotalNo,
                    UserTotalYes = (int)userNormal
                };
                return Ok(m);
            }
            else
            {
                return ReturnResponse(HttpStatusCode.Unauthorized);
            }
        }

        [Route("Answers/Answer/{UUID}")]
        [ResponseType(typeof(Models.Api.SAnswer))]
        [HttpPost]
        public async Task<IHttpActionResult> PostingAnswer(string UUID, [FromBody] Models.Api.SAnswer answer)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);

            if(user != null)
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                if(await AnswerExists(user.ID , answer.QuestionID))
                {
                    mLogManager.WarnFormat("Question ID {0} has a value in database" , answer.QuestionID);
                    return Ok(answer.QuestionID);
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

                if(answer.IsFavorited == true) // means user favourited the current question
                {
                    var favoriteCount = await FavoriteCount(user.ID);
                    if (favoriteCount < Constants.DefaultValues.FavoriteNumberOfFreeItems)
                    {
                        var newFavorite = new Favorite
                        {
                            UserID = user.ID,
                            QuestionID = answer.QuestionID,
                            SelectedDate = mDateTime.Now
                        };
                        db.Favorites.Add(newFavorite);
                        await db.SaveChangesAsync();
                    }
                    else
                    {
                        if(user.TotalStars - Constants.DefaultValues.FavoriteDefaultPrice >= 0)
                        {
                            user.TotalStars -= Constants.DefaultValues.FavoriteDefaultPrice;

                            var newFavorite = new Favorite
                            {
                                UserID = user.ID,
                                QuestionID = answer.QuestionID,
                                SelectedDate = mDateTime.Now
                            };
                            db.Favorites.Add(newFavorite);
                            await db.SaveChangesAsync();
                        }
                    }
                }
                var questionToUpdate = await db.Questions.FindAsync(answer.QuestionID);

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
                return Ok(answer.QuestionID);                
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
        private async Task<bool> AnswerExists(int id)
        {
            return await db.Answers.CountAsync(e => e.ID == id) > 0;
        }
        private async Task<bool> AnswerExists(int userID , int questionID)
        {
            return await db.Answers.CountAsync(e => e.UserID == userID && e.QuestionID == questionID) > 0;
        }
        private async Task<int> FavoriteCount(int userID)
        {
            return await db.Favorites.CountAsync(e => e.UserID == userID);
        }

        private ResponseMessageResult ReturnResponse(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }

    }
}