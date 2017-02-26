using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.Utilities.Extentions;

namespace Falcon.Web.Api.Controllers.V1
{
    public class QuestionsController : FalconApiController
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
                if (CategoryID == Constants.DefaultUser.CategoryID)
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
                                               .Join(db.Manufactures, question => question.ID , manu => manu.QuestionID ,  (question, manu) => new Models.Api.SQuestion
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
                                               }).ToArrayAsync();

                if (result.Length > 0)
                {
                    return Ok(result);
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