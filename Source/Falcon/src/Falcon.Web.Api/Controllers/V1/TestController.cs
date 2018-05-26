using Falcon.EFCommonContext;

using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Data.Entity;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    using Falcon.EFCommonContext.DbModel;
    using System.Linq;

    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {

        private readonly IDbContext mDb;

        public TestController(IDbContext Db)
        {
            mDb = Db;
        }

        [Route("v2/TestController/")]
        [HttpPost]
        public async Task<IHttpActionResult> GetInfo()
        {
            return null;
        }


        private async Task<bool> System()
        {
            var questions = await mDb.Set<QuestQuestion>().ToArrayAsync();

            var user = await mDb.Set<User>().ToListAsync();

            for (int i = 0; i < user.Count; ++i)
            {
                var questNumber = user[i].QuestNumber ?? 1;

                var questionIDs = questions.Where(u => u.QuestNumber == questNumber).Select(u => u.QuestionID).ToList();
                var id = user[i].ID;

                var questionCount = await mDb.Set<QuestQuestionsAnswer>()
                    .AsNoTracking()
                    .Where(u => u.UserID == id && questionIDs.Contains(u.QuestionID))
                    .CountAsync();

                if (questionCount == questionIDs.Count)
                {
                    var questNumberfinal = questNumber + 1;
                    if (questNumberfinal > 24)
                        continue;

                    user[i].QuestNumber = questNumberfinal;
                    user[i].QuestProgress = 0;
                    user[i].QuestPurchased = false;
                }
                else
                {
                    user[i].QuestProgress = questionCount;
                }
            }

            await mDb.SaveChangesAsync();
            return true;
        }
    }
}