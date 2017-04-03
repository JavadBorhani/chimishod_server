// Flapp Copyright 2017-2018

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
using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.Web.Models;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;

namespace Falcon.Web.Api.App_Start
{
    [UnitOfWorkActionFilter]
    public class CreatedQuestionsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IMapper mMapper;
        private readonly ICreatedQuestionsInquiryProcessor mCreatedQuestionsInquiryProcessor;
        private readonly IPagedDataRequestFactory mPagedDataRequestFactory;
        private readonly IWebUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;

        public CreatedQuestionsController(IDateTime DateTime ,
            IMapper Mapper, 
            IDbContext Database , 
            ICreatedQuestionsInquiryProcessor InquiryProcessor , 
            IPagedDataRequestFactory PagedDataRequestFactory , 
            IWebUserSession UserSession , 
            IGlobalApplicationState AppState)
        {
            mDateTime = DateTime;
            mMapper = Mapper;
            mDb = Database;
            mCreatedQuestionsInquiryProcessor = InquiryProcessor;
            mPagedDataRequestFactory = PagedDataRequestFactory;
            mUserSession = UserSession;
            mAppState = AppState;
        }

        [ResponseType(typeof(SUserState))]
        [Route("CreatedQuestions/Create/{CategoryID}")]
        [HttpPost]
        public async Task<IHttpActionResult> CreateNewQuestion(int CategoryID, [FromBody] SCreatedQuestion createdQuestion)
        {
            var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == mUserSession.UUID);

            if(user != null)
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState); //ErrorCode : 400
                }
                if (await CategoryExistsAndIsAbleToUse(user.ID , CategoryID))
                {
                    if(await CreatedQuestionExists(user.ID , createdQuestion.What , createdQuestion.But))
                    {
                        return ResponseMessage(Request.CreateResponse(HttpStatusCode.Conflict)); //409
                    }
                    var boost = await mDb.Set<QuestionBoost>().AsNoTracking()
                                                        .Where(qb => qb.ID == createdQuestion.BoostID)
                                                        .Select(qb => new { qb.Price, qb.ID})
                                                        .SingleOrDefaultAsync();

                    int boostPrice = (boost != null) ? boost.Price : 0;
                    int? boostID = (boost == null) ? (int?)null : boost.ID;

                    int newQuestionPrice = mAppState.State().Question_CreateQuestionPrice;
                    int newQuestionPrize = mAppState.State().Prize_CreateNewQuestionPrize;

                    if (HasEnoughMoney(user.TotalStars, newQuestionPrice, boostPrice)) //TODO Change Create Question Price to get from appState
                    {
                        user.TotalStars -= (newQuestionPrice + boostPrice);

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

                        mDb.Set<CreatedQuestion>().Add(newQuestion);
                        await mDb.SaveChangesAsync();

                        int nextLevelId = await GetNextLevelID(user.Level.LevelNumber);
                        LevelUpChecking(ref user, user.Level.ScoreCeil, newQuestionPrize, nextLevelId);


                        return Response(HttpStatusCode.Created, user.TotalStars);
                    }
                    else
                    {
                        return Response(HttpStatusCode.Unauthorized);
                    }
                }
                return NotFound();
            }
            return Response(HttpStatusCode.Unauthorized);
        }

        [ResponseType(typeof(SQuestion))]
        [HttpPost]
        [Route("CreatedQuestions/Get/{PageNumber}")]
        public async Task<PagedDataInquiryResponse<SNewCreatedQuestions>> GetCreatedQuestionList(int PageNumber)
        {
            var page = mPagedDataRequestFactory.Create(PageNumber, mAppState.State().Paging_DefaultPageSize);
            var createdQuestions = await mCreatedQuestionsInquiryProcessor.GetQuestionList(page , mUserSession.ID);
            return createdQuestions;
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
                result = await mDb.Set<PurchaseCategory>().AsNoTracking()
                                                    .CountAsync(pc => pc.UserID == userID && pc.CategoryID == categoryID) > 0 ;
            }
            return result;
        }


        private async Task<bool> CreatedQuestionExists(int userID , string What , string but)
        {
            return await mDb.Set<CreatedQuestion>().CountAsync(e => e.UserID == userID && e.What_if == What && e.But == but) > 0;
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