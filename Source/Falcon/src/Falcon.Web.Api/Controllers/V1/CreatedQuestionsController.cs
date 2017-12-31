// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;

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
        private readonly SApplicationState mAppState;
        private readonly IUsersMaintenanceProcessor mUsersMaintenance;
        private readonly IUserQueryProcessor mUserQuery;
        private readonly IScoringQueryProcessor mScoringQuery;
        private readonly ICreatedQuestionsMaintenanceProcessor mCreatedQuestionsMaintenanceProcessor;

        public CreatedQuestionsController(IDateTime DateTime ,
            IMapper Mapper, 
            IDbContext Database , 
            ICreatedQuestionsInquiryProcessor InquiryProcessor , 
            IPagedDataRequestFactory PagedDataRequestFactory , 
            IWebUserSession UserSession , 
            IGlobalApplicationState AppState , 
            IUsersMaintenanceProcessor UsersMaintenance,
            IUserQueryProcessor UserQuery ,
            IScoringQueryProcessor ScoringQuery,
            ICreatedQuestionsMaintenanceProcessor CreatedQuestionsMaintenanceProcessor)
        {
            mDateTime = DateTime;
            mMapper = Mapper;
            mDb = Database;
            mCreatedQuestionsInquiryProcessor = InquiryProcessor;
            mPagedDataRequestFactory = PagedDataRequestFactory;
            mUserSession = UserSession;
            mAppState = AppState.GetState();
            mUsersMaintenance = UsersMaintenance;
            mUserQuery = UserQuery;
            mCreatedQuestionsMaintenanceProcessor = CreatedQuestionsMaintenanceProcessor;
            mScoringQuery = ScoringQuery;
        }

        //[ResponseType(typeof(SUserState))]
        //[Route("CreatedQuestions/Create/{CategoryID}")]
        //[HttpPost]
        //public async Task<IHttpActionResult> CreateNewQuestion(int CategoryID, [FromBody] SCreatedQuestion createdQuestion)
        //{
        //    var user = await mDb.Set<User>().SingleOrDefaultAsync(u => u.UUID == mUserSession.UUID);

        //    if(user != null)
        //    {
        //        if (!ModelState.IsValid)
        //        {
        //            return BadRequest(ModelState); //ErrorCode : 400
        //        }
        //        if (await CategoryExistsAndIsAbleToUse(user.ID , CategoryID))
        //        {
        //            if(await CreatedQuestionExists(user.ID , createdQuestion.What , createdQuestion.But))
        //            {
        //                return ResponseMessage(Request.CreateResponse(HttpStatusCode.Conflict)); //409
        //            }
        //            var boost = await mDb.Set<QuestionBoost>().AsNoTracking()
        //                                                .Where(qb => qb.ID == createdQuestion.BoostID)
        //                                                .Select(qb => new { qb.Price, qb.ID})
        //                                                .SingleOrDefaultAsync();

        //            int boostPrice = (boost != null) ? boost.Price : 0;
        //            int? boostID = (boost == null) ? (int?)null : boost.ID;

        //            int newQuestionPrice = mAppState.Question_CreateQuestionPrice;
        //            int newQuestionXp = mAppState.Prize_CreateNewQuestionXP;
        //            int scorePrize = mAppState.Prize_CreateNewQuestionScore;

        //            if (HasEnoughMoney(user.TotalCoin, newQuestionPrice, boostPrice)) //TODO Change Create Question Price to get from appState
        //            {
        //                var newQuestion = new CreatedQuestion
        //                {
        //                    CategoryID = CategoryID,
        //                    What_if = createdQuestion.What,
        //                    But = createdQuestion.But,
        //                    UserID = user.ID,
        //                    QuestionBoostID = boostID,
        //                    VerifyStateID = (int)CreatedQuestionState.CreatedQuestionIsInChecking,
        //                    RegisterDateTime = mDateTime.Now,
        //                };

        //                mDb.Set<CreatedQuestion>().Add(newQuestion);
        //                await mDb.SaveChangesAsync();

        //                await mUsersMaintenance.LevelUp(newQuestionXp); //TODO : should
        //                await mScoringQuery.AddScore(user.ID, scorePrize, AchievedScoreType.CreateQuestion);
                      
        //                var totalCoin = await mUserQuery.DecreaseCoin(newQuestionPrice + boostPrice);

        //                return Response(HttpStatusCode.Created, totalCoin);
        //            }
        //            else
        //            {
        //                return Response(HttpStatusCode.Unauthorized);
        //            }
        //        }
        //        return NotFound();
        //    }
        //    return Response(HttpStatusCode.Unauthorized);
        //}

        //[ResponseType(typeof(SQuestion))]
        //[HttpPost]
        //[Route("CreatedQuestions/Get/{PageNumber}")]
        //public async Task<PagedDataInquiryResponse<SNewCreatedQuestions>> GetCreatedQuestionList(int PageNumber)
        //{
        //    var page = mPagedDataRequestFactory.Create(PageNumber, mAppState.Paging_DefaultPageSize);
        //    var createdQuestions = await mCreatedQuestionsInquiryProcessor.GetQuestionList(page , mUserSession.ID);
        //    return createdQuestions;
        //}

        //[ResponseType(typeof(bool))]
        //[HttpPost]
        //[Route("CreatedQuestions/Delete/")]
        //public async Task<bool> DeleteQuestionLogically([FromBody] RemoveInfo Info)
        //{
        //    if (!ModelState.IsValid)
        //        return false;

        //    var response = await mCreatedQuestionsMaintenanceProcessor.DeleteLogically(Info);
        //    return response;
        //}

        //[ResponseType(typeof(bool))]
        //[HttpPost]
        //[Route("CreatedQuestions/Edit/")]
        //public async Task<bool> EditCreatedQuestion([FromBody] EditInfo Info)
        //{
        //    if (!ModelState.IsValid)
        //        return false;

        //    var response = await mCreatedQuestionsMaintenanceProcessor.Edit(Info);
        //    return response;
        //}


        //private bool HasEnoughMoney(int TotalStar , int QuestionPrice , int BoostPrice)
        //{    
        //    return (TotalStar - QuestionPrice - BoostPrice) >= 0;
        //}
        
        //private async Task<bool> CategoryExistsAndIsAbleToUse(int userID , int categoryID)
        //{
        //    bool result = false;
        //    if (categoryID == Constants.DefaultUser.CategoryID)
        //        result = true;
        //    else
        //    {
        //        result = await mDb.Set<PurchaseCategory>().AsNoTracking()
        //                                            .CountAsync(pc => pc.UserID == userID && pc.CategoryID == categoryID) > 0 ;
        //    }
        //    return result;
        //}


        //private async Task<bool> CreatedQuestionExists(int userID , string What , string but)
        //{
        //    return await mDb.Set<CreatedQuestion>().CountAsync(e => e.UserID == userID && e.What_if == What && e.But == but) > 0;
        //}
    }
}