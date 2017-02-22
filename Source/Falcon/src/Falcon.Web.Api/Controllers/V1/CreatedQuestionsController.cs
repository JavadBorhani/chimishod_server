using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using Falcon.Common;
using System.Net.Http;
using System.Web.Http.Results;
using System.Collections.Generic;
using AutoMapper;
using Falcon.Web.Api.Utilities.Extentions;

namespace Falcon.Web.Api.App_Start
{
    [UnitOfWorkActionFilter]
    public class CreatedQuestionsController : FalconApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IDateTime mDateTime;
        private readonly IMapper mMapper;

        public CreatedQuestionsController(IDateTime DateTime , IMapper Mapper)
        {
            mDateTime = DateTime;
            mMapper = Mapper;
        }

        [ResponseType(typeof(SUserState))]
        [Route("CreatedQuestions/{UUID}/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> CreateNewQuestion(string UUID , int CategoryID, [FromBody] SCreatedQuestion createdQuestion)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == UUID);

            if(user != null)
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState); //ErrorCode : 400
                }
                if (await CategoryExistsAndIsAbleToUse(user.ID , CategoryID))
                {
                    if(CreatedQuestionExists(user.ID , createdQuestion.What , createdQuestion.But))
                    {
                        return ResponseMessage(Request.CreateResponse(HttpStatusCode.Conflict)); //409
                    }
                    var boost = await db.QuestionBoosts.AsNoTracking()
                                                        .Where(qb => qb.ID == createdQuestion.BoostID)
                                                        .Select(qb => new { qb.Price, qb.ID})
                                                        .SingleOrDefaultAsync();

                    int boostPrice = (boost != null) ? boost.Price : 0;
                    int? boostID = (boost == null) ? (int?)null : boost.ID;

                    if (HasEnoughMoney(user.TotalStars, Constants.DefaultValues.CreateNewQuestionPrice, boostPrice)) //TODO Change Create Question Price to get from appState
                    {
                        user.TotalStars -= (Constants.DefaultValues.CreateNewQuestionPrice + boostPrice);

                        var newQuestion = new CreatedQuestion
                        {
                            CategoryID = CategoryID,
                            What_if = createdQuestion.What,
                            But = createdQuestion.But,
                            UserID = user.ID,
                            QuestionBoostID = boostID,
                            VerifyStateID = Constants.DefaultValues.CreatedQuestionIsInChecking,
                            RegisterDateTime = mDateTime.Now,
                        };

                        db.CreatedQuestions.Add(newQuestion);
                        await db.SaveChangesAsync();

                        int nextLevelId = await GetNextLevelID(user.Level.LevelNumber);
                        LevelUpChecking(ref user, user.Level.ScoreCeil, Constants.Prize.CreateQuestionPrize , nextLevelId);


                        return ResponseMessage(Request.CreateResponse(HttpStatusCode.Created, user.TotalStars)); //TODO : Change this
                    }
                    else
                    {
                        return ResponseMessage(Request.CreateResponse(HttpStatusCode.Unauthorized));
                    }
                }
                return NotFound();
            }
            return ResponseMessage(Request.CreateResponse(HttpStatusCode.Unauthorized)); //TODO Change to global answer UnAuthoraized
        }

        [ResponseType(typeof(SQuestion))]
        [HttpPost]
        [Route("CreatedQuestions/{UUID}")]
        public async Task<IHttpActionResult> GetCreatedQuestionList(string UUID)
        {
            var userID = await db.Users.AsNoTracking().Where(u => u.UUID == UUID).Select(u => u.ID).SingleOrDefaultAsync();
            if(userID != 0)
            {
                List<SNewCreatedQuestions> output = new List<SNewCreatedQuestions>();

                var questions = await db.Manufactures.AsNoTracking()
                                                    .Where(u => u.UserID == userID)
                                                    .Select(u => u.Question)
                                                    .Where( u => u.Banned == false)
                                                    .ToListAsync();

                output.AddRange(mMapper.Map<List<Question>, List<SNewCreatedQuestions>>(questions));

                var createdQuestions = await db.CreatedQuestions.AsNoTracking().Where(cq => cq.UserID == userID && 
                                                                (   
                                                                    cq.VerifyStateID == Constants.DefaultValues.CreatedQuestionIsInChecking || 
                                                                    cq.VerifyStateID == Constants.DefaultValues.CreatedQuestionRejected
                                                                ))
                                                                .ToListAsync();

                output.AddRange(mMapper.Map<List<CreatedQuestion>, List<SNewCreatedQuestions>>(createdQuestions));

                return Ok(output);
            }
            else
            {
                return Response(HttpStatusCode.Unauthorized);
            }
        }

        private bool HasEnoughMoney(int TotalStar , int QuestionPrice , int BoostPrice)
        {    
            return (TotalStar - QuestionPrice - BoostPrice) >= 0;
        }
        
        private async Task<bool> CategoryExistsAndIsAbleToUse(int userID , int categoryID)
        {
            bool result = false;
            if (categoryID == Constants.DefaultUser.CategoryID)
                result = true;
            else
            {
                result = await db.PurchaseCategories.AsNoTracking()
                                                    .CountAsync(pc => pc.UserID == userID && pc.CategoryID == categoryID) > 0 ;
            }
            return result;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CreatedQuestionExists(int userID , string What , string but)
        {
            return db.CreatedQuestions.Count(e => e.UserID == userID && e.What_if == What && e.But == but) > 0;
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
            return await db.Levels.AsNoTracking().Where(l => l.LevelNumber == (currnetLevelNumber + 1)).Select(l => l.ID).SingleOrDefaultAsync();
        }
    }
}