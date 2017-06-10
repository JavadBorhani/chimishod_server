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
using Falcon.EFCommonContext;
using Falcon.Web.Common;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class AnswersController : FalconApiController
    {
        private readonly IDateTime mDateTime;
        private readonly ILog mLogger;
        private readonly IMapper mMapper;
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly SApplicationState mAppState;

        public AnswersController(IDateTime dateTime , 
            ILogManager logManager , 
            IMapper Mapper , 
            IDbContext Database , 
            IWebUserSession UserSession , 
            IGlobalApplicationState AppState)
        {
            mDateTime = dateTime;
            mLogger = logManager.GetLog(typeof(AnswersController));
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState.GetState();
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
        [Route("Statistics/")]
        [ResponseType(typeof(SUserStatistics))]
        public async Task<IHttpActionResult> GetStatistics()
        {
            
            int userTotalYes = 0;
            int userTotalNo = 0;
            float userNormal = 0;

            var userAndQuestion = await mDb.Set<Answer>().AsNoTracking()
                                                .Include(u => u.Question)
                                                .Where( u => u.UserID == mUserSession.ID)
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

        [Route("Answers/Answer/")]
        [HttpPost]
        public async Task<IHttpActionResult> PostingAnswer([FromBody] SAnswer answer)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == mUserSession.UUID);
            //TODO : Remember to Remove Extar Save Changes on database ;
            if (user != null)
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                if (await AnswerExists(user.ID, answer.QuestionID))
                {
                    mLogger.WarnFormat("Question ID {0} has a value in database", answer.QuestionID);
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
                    if (favoriteCount < mAppState.Favorite_FreeNumberToFavorite)
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
                        if (user.TotalCoin - mAppState.Favorite_FavoritePrice >= 0)
                        {
                            user.TotalCoin -= mAppState.Favorite_FavoritePrice;

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

                        if(questionToUpdate.ActionID != null)
                        {
                            user.TotalCoin += questionToUpdate.QuestionAction.Coin;
                        }
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
                            otherUser.Score         += mAppState.Prize_LikePrize;
                            otherUser.LevelProgress += mAppState.Prize_LikePrize;
                        }
                    }
                    else if (answer.Dislike != null)
                    {
                        ++questionToUpdate.Dislike_Count;
                    }

                    await mDb.SaveChangesAsync();
                }

                int prizeCoefficient = questionToUpdate.Category.PrizeCoefficient;
                if (mAppState.Prize_AnswerPrize > 0 && prizeCoefficient > 0 )
                {
                    int nextLevelId = await GetNextLevelID(user.Level.LevelNumber);
                    LevelUpChecking(ref user, user.Level.ScoreCeil, mAppState.Prize_AnswerPrize * prizeCoefficient, nextLevelId);
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

                    var answerRef = mDb.Set<Answer>();
                    var manuRef = mDb.Set<Manufacture>();

                    Questions = await mDb.Set<Question>().AsNoTracking().Where(question => question.Banned == false && question.Catgory_ID == CatToGet &&
                                                   !answerRef.Where(a => a.UserID == user.ID)
                                                   .Select(y => y.QuestionID)
                                                   .ToList()
                                                   .Contains(question.ID))
                                                   .OrderByDescending(question => question.Weight)
                                                   .Include( q => q.QuestionAction)
                                                   .Take(mAppState.Question_DefaultReturnAmount)
                                                   .Join(manuRef, question => question.ID, manu => manu.QuestionID, (question, manu) => new SQuestion
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
                                                       UserName = manu.User.UserName, 
                                                       ActionCoin = question.QuestionAction.Coin,
                                                       ActionId = question.QuestionAction.ActionNumber
                                                   })
                                                   .OrderByDescending(a => a.Weight)
                                                   .ToArrayAsync();

                    if (Questions.Length > 0)
                    {
                      
                        return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { Questions, answer.QuestionID }));
                    }

                    Questions = new SQuestion[mAppState.Question_ServerBurntReturnAmount];
                    for (int i = 0; i < mAppState.Question_ServerBurntReturnAmount; ++i)
                    {
                        Questions[i] = new SQuestion
                        {
                            ID = mAppState.Question_NoQuestionFoundID,
                            What_if = mAppState.Question_NoQuestionFoundWhat,
                            But = mAppState.Question_NoQuestionFoundBut
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