// Flapp Copyright 2017-2018

using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class QuestionsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly SApplicationState mAppState;
        private readonly IQuestionsInquiryProcessor mQuestionInquiry;

        public QuestionsController(IDbContext Database, IWebUserSession UserSession, IGlobalApplicationState AppState , IQuestionsInquiryProcessor QuestionInquiry)
        {
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState.GetState();
            mQuestionInquiry = QuestionInquiry;
        }

        [ResponseType(typeof(Models.Api.SQuestion))]
        [Route("Questions/Question/{CategoryID}")]
        [HttpGet]

        public async Task<IHttpActionResult> GettingQuestion(int CategoryID)
        {

            bool isAbleToGetCategory;
            if (CategoryID == Constants.DefaultUser.CategoryID)
                isAbleToGetCategory = true;
            else
                isAbleToGetCategory = await mDb.Set<PurchaseCategory>().AsNoTracking().CountAsync(pc => pc.UserID == mUserSession.ID && pc.CategoryID == CategoryID) == 1;

            int CatToGet = -1;
            if (isAbleToGetCategory)
            {
                CatToGet = CategoryID;
            }
            else
            {
                CatToGet = await mDb.Set<SelectedCategory>().AsNoTracking().Where(sc => sc.UserID == mUserSession.ID).Select(sc => sc.CategoryID).SingleOrDefaultAsync();
            }

            var answerRef = mDb.Set<Answer>();
            var manuRef = mDb.Set<Manufacture>();

            var result = await mDb.Set<Question>().AsNoTracking().Where(question => question.Banned == false && question.Catgory_ID == CatToGet &&
                                            !answerRef.Where(answer => answer.UserID == mUserSession.ID)
                                            .Select(y => y.QuestionID)
                                            .ToList()
                                            .Contains(question.ID))
                                            .OrderByDescending(question => question.Weight)
                                            .Include(q => q.QuestionAction)
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
                                                ActionInfo = new SActionQuestion
                                                {
                                                    ActionCoin = question.QuestionAction.Coin,
                                                    ActionId = question.QuestionAction.ActionNumber,
                                                    ActionNavigationPageNumber = question.QuestionAction.ActionNavigationNumber,
                                                    MarketPackageName = question.QuestionAction.MarketPackageName,
                                                    MarketIntentString = question.QuestionAction.MarketIntentString,
                                                    AppStoreUri = question.QuestionAction.AppStoreUri,
                                                },
                                                CommentCount = question.CommentCount
                                            })
                                            .OrderByDescending(a => a.Weight)
                                            .ToArrayAsync();

            if (result.Length > 0)
            {
                return Ok(result);
            }

            SQuestion[] noQuestion = new Models.Api.SQuestion[mAppState.Question_ServerBurntReturnAmount];
            for (int i = 0; i < mAppState.Question_ServerBurntReturnAmount; ++i)
            {
                noQuestion[i] = new Models.Api.SQuestion
                {
                    ID = mAppState.Question_NoQuestionFoundID,
                    What_if = mAppState.Question_NoQuestionFoundWhat,
                    But = mAppState.Question_NoQuestionFoundBut
                };
            }
            return Ok(noQuestion);
        }

        [ResponseType(typeof(SQuestion[]))]
        [Route("Questions/{CategoryID}")]
        [HttpPost]

        public async Task<SQuestion[]> RetrieveQuestion(int CategoryID)
        {
            var result = await mQuestionInquiry.PrepareQuestionList(CategoryID);
            return result;
        }
    }
}