using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    public class QuestionsController : FalconApiController
    {

        private readonly IQuestionsInquiryProcessor mQuestionInquiry;
        private readonly IQuestionsMaintenanceProcessor mQuestionMaintenance;

        public QuestionsController(IQuestionsInquiryProcessor QuestionInquiry, IQuestionsMaintenanceProcessor QuestionMaintenance)
        {
            mQuestionInquiry = QuestionInquiry;
            mQuestionMaintenance = QuestionMaintenance;
        }

        [Route("v2/Questions/Normal")]
        [ResponseType(typeof(SUser))]
        [HttpPost]
        public async Task<SUser> GetNormalQuestionList()
        {
            return null;
        }


        [Route("v2/Questions/Level/{LevelNumber}")]
        [ResponseType(typeof(SUser))]
        [HttpPost]
        public async Task<SUser> GetLevelQuestions(int LevelNumber)
        {
            return null;
        }
    }
}
