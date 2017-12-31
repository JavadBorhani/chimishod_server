// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using log4net;

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
        private readonly ICharacteristicsMaintenanceProcessor mCharacteristicsMaintenanceProcessor;
        private readonly ICharacteristicsInquiryProcessor mCharacteristicsInquiryProcessor;
        private readonly IScoringQueryProcessor mScoringQueryProcessor;
        private readonly IUsersMaintenanceProcessor mUsersMaintenance;
        private readonly IAnswerMaintenanceProcessor mAnswerMaintenance;


        public AnswersController(IDateTime dateTime , 
            ILogManager logManager , 
            IMapper Mapper , 
            IDbContext Database , 
            IWebUserSession UserSession , 
            IGlobalApplicationState AppState,
            ICharacteristicsMaintenanceProcessor CharacteristicsMaintenanceProcessor ,
            ICharacteristicsInquiryProcessor CharacteristicsInquiryProcessor , 
            IScoringQueryProcessor ScoringQueryProcessor , 
            IUsersMaintenanceProcessor UserMaintenanceProcessor , 
            IAnswerMaintenanceProcessor AnswerMaintenance) 
        {
            mDateTime = dateTime;
            mLogger = logManager.GetLog(typeof(AnswersController));
            mMapper = Mapper;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState.GetState();
            mCharacteristicsMaintenanceProcessor = CharacteristicsMaintenanceProcessor;
            mCharacteristicsInquiryProcessor = CharacteristicsInquiryProcessor;
            mScoringQueryProcessor = ScoringQueryProcessor;
            mUsersMaintenance = UserMaintenanceProcessor;
            mAnswerMaintenance = AnswerMaintenance;

        }

        //public IQueryable<Answer> GetAnswers()
        //{
        //    return mDb.Set<Answer>();
        //}

        //[ResponseType(typeof(SAnswer))]
        //public async Task<IHttpActionResult> GetAnswer(int id)
        //{
        //    Answer answer = await mDb.Set<Answer>().FindAsync(id);
        //    if (answer == null)
        //    {
        //        return NotFound();
        //    }
        //    var result = new SAnswer
        //    {
        //        UserID = answer.UserID,
        //        QuestionID = answer.QuestionID,
        //        Dislike = answer.Dislike,
        //        Liked = answer.Liked,
        //        YesNoState = answer.YesNoState,
        //        CreatedDate = answer.CreatedDate,
        //        IsFavorited = true
        //    };
        //    return Ok(result);
        //}

        //[HttpPost]
        //[Route("Statistics/")]
        //[ResponseType(typeof(SUserStatistics))]
        //public async Task<IHttpActionResult> GetStatistics()
        //{
            
        //    int userTotalYes = 0;
        //    int userTotalNo = 0;
        //    float userNormal = 0;

        //    var userAndQuestion = await mDb.Set<Answer>().AsNoTracking()
        //                                        .Include(u => u.Question)
        //                                        .Where( u => u.UserID == mUserSession.ID)
        //                                        .Select( u => new { u.YesNoState, u.Question.Yes_Count , u.Question.No_Count, u.Question.Banned })
        //                                        .ToArrayAsync(); 
                
        //    if(userAndQuestion.Length >  0 )
        //    {
        //        for (int i = 0; i < userAndQuestion.Length; ++i)
        //        {
        //            if (userAndQuestion[i].Banned == false)
        //            {
        //                userTotalYes = (userAndQuestion[i].YesNoState == true) ? (++userTotalYes) : userTotalYes;
        //                userTotalNo = (userAndQuestion[i].YesNoState == false) ? (++userTotalNo) : userTotalNo;

                            
        //                var total = userAndQuestion[i].Yes_Count + userAndQuestion[i].No_Count;
        //                total = (total == 0) ? 1 : total;
        //                float yesPercent = userAndQuestion[i].Yes_Count * 100.0f / total;
        //                float noPercent = userAndQuestion[i].No_Count * 100.0f / total;

        //                userNormal += ((userAndQuestion[i].YesNoState == true) ? yesPercent : noPercent);
        //            }
        //        }
        //        userNormal = userNormal / userAndQuestion.Length;
        //    }
        //    SUserStatistics m = new SUserStatistics
        //    {
        //        UserNormal = (int)userNormal,
        //        UserTotalNo = userTotalNo,
        //        UserTotalYes = userTotalYes
        //    };
        //    return Ok(m);
        //}

        //[Route("Answers/Answer/")]
        //[HttpPost]
        //public async Task<IHttpActionResult> PostingAnswer([FromBody] SAnswer answer)
        //{
        //    var result = await mAnswerMaintenance.Answer(answer);

        //    SQuestion[] Questions;
        //    if (answer.SendQuestion)
        //    {
        //        bool isAbleToGetCategory;

        //        if (answer.CategoryToGetQuestion == Constants.DefaultUser.CategoryID)
        //            isAbleToGetCategory = true;
        //        else
        //            isAbleToGetCategory = await mDb.Set<PurchaseCategory>().AsNoTracking().CountAsync(pc => pc.UserID == mUserSession.ID && pc.CategoryID == answer.CategoryToGetQuestion) == 1;

        //        int CatToGet = -1;
        //        if (isAbleToGetCategory)
        //        {
        //            CatToGet = answer.CategoryToGetQuestion;
        //        }
        //        else
        //        {
        //            CatToGet = await mDb.Set<SelectedCategory>().AsNoTracking().Where(sc => sc.UserID == mUserSession.ID).Select(sc => sc.CategoryID).SingleOrDefaultAsync();
        //        }

        //        var answerRef = mDb.Set<Answer>();
        //        var manuRef = mDb.Set<Manufacture>();

        //        Questions = await mDb.Set<Question>().AsNoTracking().Where(question => question.Banned == false && question.Catgory_ID == CatToGet &&
        //                                        !answerRef.Where(a => a.UserID == mUserSession.ID)
        //                                        .Select(y => y.QuestionID)
        //                                        .ToList()
        //                                        .Contains(question.ID))
        //                                        .OrderByDescending(question => question.Weight)
        //                                        .Include(q => q.QuestionAction)
        //                                        .Take(mAppState.Question_DefaultReturnAmount)
        //                                        .Join(manuRef, question => question.ID, manu => manu.QuestionID, (question, manu) => new SQuestion
        //                                        {
        //                                            ID = question.ID,
        //                                            What_if = question.What_if,
        //                                            But = question.But,
        //                                            Catgory_ID = question.Catgory_ID,
        //                                            Yes_Count = question.Yes_Count,
        //                                            No_Count = question.No_Count,
        //                                            Like_Count = question.Like_Count,
        //                                            Dislike_Count = question.Dislike_Count,
        //                                            Weight = question.Weight,
        //                                            Banned = question.Banned,
        //                                            UserName = manu.User.UserName,
        //                                            ActionInfo = new SActionQuestion
        //                                            {
        //                                                ActionCoin = question.QuestionAction.Coin,
        //                                                ActionId = question.QuestionAction.ActionNumber,
        //                                                ActionNavigationPageNumber = question.QuestionAction.ActionNavigationNumber,
        //                                                MarketPackageName = question.QuestionAction.MarketPackageName,
        //                                                MarketIntentString = question.QuestionAction.MarketIntentString,
        //                                                AppStoreUri = question.QuestionAction.AppStoreUri,
        //                                            },
        //                                            CommentCount = question.CommentCount
        //                                        })
        //                                        .OrderByDescending(a => a.Weight)
        //                                        .ToArrayAsync();

        //        if (Questions.Length > 0)
        //        {

        //            return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { Questions, answer.QuestionID }));
        //        }

        //        Questions = new SQuestion[mAppState.Question_ServerBurntReturnAmount];
        //        for (int i = 0; i < mAppState.Question_ServerBurntReturnAmount; ++i)
        //        {
        //            Questions[i] = new SQuestion
        //            {
        //                ID = mAppState.Question_NoQuestionFoundID,
        //                What_if = mAppState.Question_NoQuestionFoundWhat,
        //                But = mAppState.Question_NoQuestionFoundBut
        //            };
        //        }
        //        return ResponseMessage(Request.CreateResponse(HttpStatusCode.OK, new { Questions, answer.QuestionID }));
        //    }
        //    else
        //    {
        //        return Response(HttpStatusCode.OK, answer.QuestionID);
        //    }

        //}

        //private async Task<bool> AnswerExists(int userID , int questionID)
        //{
        //    return await mDb.Set<Answer>().CountAsync(e => e.UserID == userID && e.QuestionID == questionID) > 0;
        //}

        //private async Task<int> FavoriteCount(int userID)
        //{
        //    return await mDb.Set<Favorite>().CountAsync(e => e.UserID == userID);
        //}

    }
}