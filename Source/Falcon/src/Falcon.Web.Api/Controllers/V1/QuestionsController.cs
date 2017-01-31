using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;

namespace Falcon.Web.Api.Controllers.V1
{
    public class QuestionsController : ApiController
    {
        private DbEntity db = new DbEntity();


        [ResponseType(typeof(Models.Api.SQuestion))]
        [Route("Questions/Question/{UUID}/{CategoryID}")]
        [HttpGet]
        public  async Task<IHttpActionResult> GettingQuestion(string uuid , int CategoryID)
        {
            var user = await db.Users.SingleOrDefaultAsync(u => u.UUID == uuid);
            
            if(user != null)
            {

                bool isAbleToGetCategory;
                if (CategoryID == Constants.DefaulUser.CategoryID)
                    isAbleToGetCategory = true; 
                else
                    isAbleToGetCategory = await db.PurchaseCategories.AsNoTracking().CountAsync( pc => pc.UserID == user.ID && pc.CategoryID == CategoryID ) == 1;

                int CatToGet = -1;
                if (isAbleToGetCategory)
                {
                    CatToGet = CategoryID;
                }
                else
                {
                    CatToGet = await db.SelectedCategories.AsNoTracking().Where(sc => sc.UserID == user.ID).Select(sc => sc.CategoryID).SingleOrDefaultAsync();
                }

                var result = await db.Questions.Where(question => question.Banned == false && question.Catgory_ID == CatToGet &&
                                               !db.Answers.Where(answer => answer.UserID == user.ID)
                                               .Select(y => y.QuestionID)
                                               .ToList()
                                               .Contains(question.ID))
                                               .OrderByDescending(question => question.Weight)
                                               .Take(Constants.DefaultReturnAmounts.Question)
                                               .ToArrayAsync();

                if (result.Length > 0)
                {
                    //TODO : Refactor SQuestion Data Model 
                    Models.Api.SQuestion[] questions = new Models.Api.SQuestion[result.Length];
                    for (int i = 0; i < questions.Length; ++i)
                    {
                        questions[i] = new Models.Api.SQuestion
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
                    return Ok(questions);
                }

                Models.Api.SQuestion[] noQuestion = new Models.Api.SQuestion[Constants.DefaultReturnAmounts.ServerBurntNumber];
                for (int i = 0; i < Constants.DefaultReturnAmounts.ServerBurntNumber; ++i)
                {
                    noQuestion[i] = new Models.Api.SQuestion
                    {
                        ID = Constants.DefaultValues.NoQuestionID,
                        What_if = Constants.DefaultValues.NoQuestionWhat,
                        But = Constants.DefaultValues.NoQuestionBut
                    };
                }
                return Ok(noQuestion);
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

    }
}