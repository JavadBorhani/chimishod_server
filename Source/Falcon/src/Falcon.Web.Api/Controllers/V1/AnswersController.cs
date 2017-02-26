// Flapp Copyright 2017-2018

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
using Falcon.Web.Api.Utilities.Extentions;
using Falcon.EFCommonContext;
using Falcon.Web.Common;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class AnswersController : FalconApiController
    {
        private readonly IDateTime mDateTime;
        private readonly ILog mLogManager;
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;

        public AnswersController(IDateTime dateTime , ILogManager logManager , IMapper Mapper , IDbContext Database)
        {
            mDateTime = dateTime;
            mLogManager = logManager.GetLog(typeof(AnswersController));
            mMapper = Mapper;
            mDb = Database;
        }

        public IQueryable<Answer> GetAnswers()
        {
            return mDb.Set<Answer>();
        }

        [ResponseType(typeof(SAnswer))]
        public async Task<IHttpActionResult> GetAnswer(int id)
        {
            Answer answer = await mDb.Set<Answer>().FindAsync(id);
            if (answer == null)
            {
                return NotFound();
            }
            var result = new SAnswer
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
            var userID = await mDb.Set<User>().AsNoTracking().Where(u => u.UUID == UUID).Select( u => u.ID).SingleOrDefaultAsync();

            if(userID != 0)
            {
                int userTotalYes = 0;
                int userTotalNo = 0;
                float userNormal = 0;

                var userAndQuestion = await mDb.Set<Answer>().AsNoTracking()
                                                    .Where( u => u.UserID == userID)
                                                    .Select( u => new { u.YesNoState, u.Question.Yes_Count , u.Question.No_Count, u.Question.Banned })
                                                    .ToArrayAsync(); 
                
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
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == UUID);
            //TODO : Remember to Remove Extar Save Changes on database ;
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

                mDb.Set<Answer>().Add(newAnswer);
                await mDb.SaveChangesAsync();


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
                        mDb.Set<Favorite>().Add(newFavorite);
                        await mDb.SaveChangesAsync();
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
                            mDb.Set<Favorite>().Add(newFavorite);
                            await mDb.SaveChangesAsync();
                        }
                    }
                }
                var questionToUpdate = await mDb.Set<Question>().Where(q => q.ID ==  answer.QuestionID).Include( q => q.Category).SingleOrDefaultAsync();

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
                        var otherUser = await mDb.Set<Manufacture>().Where(m => m.QuestionID == answer.QuestionID)
                                                                .Include(m => m.User)
                                                                .Select(m => m.User)
                                                                .SingleOrDefaultAsync();
                        if(otherUser != null)
                        {
                            otherUser.Score         += Constants.Prize.LikeQuestion;
                            otherUser.LevelProgress += Constants.Prize.LikeQuestion;
                        }
                    }
                    else if (answer.Dislike != null)
                    {
                        ++questionToUpdate.Dislike_Count;
                    }
                    await mDb.SaveChangesAsync();
                }

                int prizeCoefficient = questionToUpdate.Category.PrizeCoefficient;
                if (Constants.Prize.Answering > 0 && prizeCoefficient > 0 )
                {
                    int nextLevelId = await GetNextLevelID(user.Level.LevelNumber);
                    LevelUpChecking(ref user, user.Level.ScoreCeil, Constants.Prize.Answering * prizeCoefficient, nextLevelId);
                    await mDb.SaveChangesAsync();
                }
                
                SQuestion[] Questions;
                if (answer.SendQuestion)
                {
                    bool isAbleToGetCategory;

                    if (answer.CategoryToGetQuestion == Constants.DefaultUser.CategoryID)
                        isAbleToGetCategory = true;
                    else
                        isAbleToGetCategory = await mDb.Set<PurchaseCategory>().AsNoTracking().CountAsync(pc => pc.UserID == user.ID && pc.CategoryID == answer.CategoryToGetQuestion) == 1;

                    int CatToGet = -1;
                    if (isAbleToGetCategory)
                    {
                        CatToGet = answer.CategoryToGetQuestion;
                    }
                    else
                    {
                        CatToGet = await mDb.Set<SelectedCategory>().AsNoTracking().Where(sc => sc.UserID == user.ID).Select(sc => sc.CategoryID).SingleOrDefaultAsync();
                    }

                    Questions = await mDb.Set<Question>().Where(question => question.Banned == false && question.Catgory_ID == CatToGet &&
                                                   !mDb.Set<Answer>().Where(a => a.UserID == user.ID)
                                                   .Select(y => y.QuestionID)
                                                   .ToList()
                                                   .Contains(question.ID))
                                                   .OrderByDescending(question => question.Weight)
                                                   .Take(Constants.DefaultReturnAmounts.Question)
                                                   .Join(mDb.Set<Manufacture>(), question => question.ID, manu => manu.QuestionID, (question, manu) => new SQuestion
                                                   {
                                                       ID = question.ID,
                                                       What_if = question.What_if,
                                                       But = question.But,
                                                       Catgory_ID = question.Catgory_ID,
                                                       Yes_Count = question.Yes_Count,
                                                       No_Count = question.No_Count,
                                                       Like_Count = question.Like_Count,
                                                       Dislike_Count = question.Dislike_Count,
                                                       Weight = question.Weight,
                                                       Banned = question.Banned,
                                                       UserName = manu.User.UserName
                                                   })
                                                   .ToArrayAsync();

                    if (Questions.Length > 0)
                    {
                      
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

        private async Task<bool> AnswerExists(int userID , int questionID)
        {
            return await mDb.Set<Answer>().CountAsync(e => e.UserID == userID && e.QuestionID == questionID) > 0;
        }

        private async Task<int> FavoriteCount(int userID)
        {
            return await mDb.Set<Favorite>().CountAsync(e => e.UserID == userID);
        }
        private void LevelUpChecking(ref User user, int levelCeil, int Prize, int nextLevelID)
        {
            user.Score += Prize;
            if (user.LevelProgress + Prize >= levelCeil)
            {
                user.CurrentLevelID = nextLevelID;
                int remained = (user.LevelProgress + Prize) - levelCeil;
                user.LevelProgress = remained;
            }
            else
            {
                user.LevelProgress += Prize;
            }
        }

        private async Task<int> GetNextLevelID(int currnetLevelNumber)
        {
            return await mDb.Set<Level>().AsNoTracking().Where(l => l.LevelNumber == (currnetLevelNumber + 1)).Select(l => l.ID).SingleOrDefaultAsync();
        }
    }
}