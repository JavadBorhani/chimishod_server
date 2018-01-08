using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Report;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    public class QuestionReportController
    {
        private readonly IQuestionReportInquiryProcessor mReportInquiry;
        private readonly IQuestionReportMaintenanceProcessor mReportMaintenance;
        public QuestionReportController(IQuestionReportInquiryProcessor ReportInquiry , IQuestionReportMaintenanceProcessor ReportMaintenance)
        {
            mReportInquiry = ReportInquiry;
            mReportMaintenance = ReportMaintenance;
        }

        [ResponseType(typeof(SReportType))]
        [Route("v2/ReportTypes/")]
        [HttpPost]
        public async Task<SReportType[]> GetReportTypes()
        {
            var result = await mReportInquiry.GetReportList();
            return result;
        }

        [Route("v2/ReportedQuestion/")] //TODO Refactor this to packet
        [HttpPost]
        public async Task<bool> ReportQuestion(SReportedQuestion Question)
        {
            var result = await mReportMaintenance.ReportQuestion(Question);
            return result;

        }


    }
}