using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;

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
    }
}
