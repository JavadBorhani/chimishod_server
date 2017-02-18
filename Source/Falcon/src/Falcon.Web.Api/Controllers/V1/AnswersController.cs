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

        [ResponseType(typeof(SAnswer))]
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

                            
                            var total = userAndQuestion[i].Yes_Count + userAndQuestion[i].No_Count;
                            total = (total == 0) ? 1 : total;
                            float yesPercent = userAndQuestion[i].Yes_Count * 100.0f / total;
                            float noPercent = userAndQuestion[i].No_Count * 100.0f / total;

                            userNormal += ((userAndQuestion[i].YesNoState == true) ? yesPercent : noPercent);
                        }
                    }
                    userNormal = userNormal / userAndQuestion.Length;
                }
                SUserStatistics m = new SUserStatistics
                {
                    UserNormal = (int)userNormal,
                    UserTotalNo = userTotalNo,
                    UserTotalYes = userTotalYes
                };
                return Ok(m);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        [Route("Answers/Answer/{UUID}")]
        [HttpPost]
        public async Task<IHttpActionResult> PostingAnswer(string UUID, [FromBody] SAnswer answer)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);

            if (user != null)
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                if (await AnswerExists(user.ID, answer.QuestionID))
                {
                    mLogManager.WarnFormat("Question ID {0} has a value in database", answer.QuestionID);
                    return Response(HttpStatusCode.Unauthorized);
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

                if (answer.IsFavorited == true) // means user favourited the current question
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
                        if (user.TotalStars - Constants.DefaultValues.FavoriteDefaultPrice >= 0)
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

                if (questionToUpdate != null)
                {
                    if (answer.YesNoState)
                    {
                        ++questionToUpdate.Yes_Count;
                    }
                    else
                    {
                        ++questionToUpdate.No_Count;
                    }
                    if (answer.Liked != null)
                    {
                        ++questionToUpdate.Like_Count;
                    }
                    else if (answer.Dislike != null)
                    {
                        ++questionToUpdate.Dislike_Count;
                    }
                    await db.SaveChangesAsync();
                }
                SQuestion[] Questions;
                if (answer.SendQuestion)
                {
                    bool isAbleToGetCategory;

                    if (answer.CategoryToGetQuestion == Constants.DefaultUser.CategoryID)
                        isAbleToGetCategory = true;
                    else
                        isAbleToGetCategory = await db.PurchaseCategories.AsNoTracking().CountAsync(pc => pc.UserID == user.ID && pc.CategoryID == answer.CategoryToGetQuestion) == 1;

                    int CatToGet = -1;
                    if (isAbleToGetCategory)
                    {
                        CatToGet = answer.CategoryToGetQuestion;
                    }
                    else
                    {
                        CatToGet = await db.SelectedCategories.AsNoTracking().Where(sc => sc.UserID == user.ID).Select(sc => sc.CategoryID).SingleOrDefaultAsync();
                    }

                    var result = await db.Questions.Where(question => question.Banned == false && question.Catgory_ID == CatToGet &&
                                                   !db.Answers.Where(a => a.UserID == user.ID)
                                                   .Select(y => y.QuestionID)
                                                   .ToList()
                                                   .Contains(question.ID))
                                                   .OrderByDescending(question => question.Weight)
                                                   .Take(Constants.DefaultReturnAmounts.Question)
                                                   .ToArrayAsync();

                    if (result.Length > 0)
                    {
                        //TODO : Refactor SQuestion Data Model 
                        Questions = new SQuestion[result.Length];
                        for (int i = 0; i < Questions.Length; ++i)
                        {
                            Questions[i] = new SQuestion
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
                                CreatedDate = result[i].CreatedDate,
                                UpdateDate = result[i].UpdateDate,
                                Banned = result[i].Banned
                            };
                        }
                        return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { Questions, answer.QuestionID }));
                    }

                    Questions = new SQuestion[Constants.DefaultReturnAmounts.ServerBurntNumber];
                    for (int i = 0; i < Constants.DefaultReturnAmounts.ServerBurntNumber; ++i)
                    {
                        Questions[i] = new SQuestion
                        {
                            ID = Constants.DefaultValues.NoQuestionID,
                            What_if = Constants.DefaultValues.NoQuestionWhat,
                            But = Constants.DefaultValues.NoQuestionBut
                        };
                    }
                    return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { Questions, answer.QuestionID }));
                }
                else
                {
                    return Response(HttpStatusCode.OK, answer.QuestionID);
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

        private async Task<bool> AnswerExists(int userID , int questionID)
        {
            return await db.Answers.CountAsync(e => e.UserID == userID && e.QuestionID == questionID) > 0;
        }

        private async Task<int> FavoriteCount(int userID)
        {
            return await db.Favorites.CountAsync(e => e.UserID == userID);
        }

        private ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }

        private ResponseMessageResult Response(HttpStatusCode Code, object DataToSend)
        {
            return ResponseMessage(Request.CreateResponse(Code, DataToSend));
        }

    }
}