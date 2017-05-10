// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class QuestionsController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly SApplicationState mAppState;

        public QuestionsController(IDbContext Database , IWebUserSession UserSession , IGlobalApplicationState AppState)
        {
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState.State();
        }

        [ResponseType(typeof(Models.Api.SQuestion))]
        [Route("Questions/Question/{CategoryID}")]
        [HttpGet]

        public  async Task<IHttpActionResult> GettingQuestion(int CategoryID)
        {
            
            bool isAbleToGetCategory;
            if (CategoryID == Constants.DefaultUser.CategoryID)
                isAbleToGetCategory = true; 
            else
                isAbleToGetCategory = await mDb.Set<PurchaseCategory>().AsNoTracking().CountAsync( pc => pc.UserID == mUserSession.ID && pc.CategoryID == CategoryID ) == 1;

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
                                            .Join(manuRef, question => question.ID , manu => manu.QuestionID ,  (question, manu) => new SQuestion
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
                                            }).ToArrayAsync();

            if (result.Length > 0)
            {
                return Ok(result);
            }

            Models.Api.SQuestion[] noQuestion = new Models.Api.SQuestion[mAppState.Question_ServerBurntReturnAmount];
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

    }
}