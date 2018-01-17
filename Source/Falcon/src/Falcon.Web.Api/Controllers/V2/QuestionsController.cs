using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Models.Api;
using System.Collections.Generic;
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

        [Route("v2/Questions")]
        [ResponseType(typeof(List<SQuestion>))]
        [HttpPost]
        public async Task<List<SQuestion>> GetNormalQuestionList()
        {
            var questions = await mQuestionInquiry.PrepareQuestionList();

            return questions;
        }


        [Route("v2/Questions/Level/{LevelNumber}")]
        [ResponseType(typeof(SQuestion))]
        [HttpPost]
        public async Task<SQuestion> GetLevelQuestions(int LevelNumber)
        {
            var questions = await mQuestionInquiry.FetchLevelQuestions(LevelNumber);
            return null;
        }
    }
}
