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

namespace Falcon.Web.Api.App_Start
{
    [UnitOfWorkActionFilter]
    public class CreatedQuestionsController : ApiController
    {
        private DbEntity db = new DbEntity();

        private readonly IDateTime mDateTime;

        public CreatedQuestionsController(IDateTime DateTime)
        {
            mDateTime = DateTime;
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
                            VerifyStateID = Constants.DefaultValues.CreateNewQuestionVerifyState,
                            RegisterDateTime = mDateTime.Now,
                        };

                        db.CreatedQuestions.Add(newQuestion);
                        await db.SaveChangesAsync();

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

        private bool HasEnoughMoney(int TotalStar , int QuestionPrice , int BoostPrice)
        {    
            return (TotalStar - QuestionPrice - BoostPrice) >= 0;
        }
        
        private async Task<bool> CategoryExistsAndIsAbleToUse(int userID , int categoryID)
        {
            bool result = false;
            if (categoryID == Constants.DefaulUser.CategoryID)
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
    }
}