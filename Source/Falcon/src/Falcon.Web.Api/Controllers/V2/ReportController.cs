using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Report;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [RoutePrefix("v2/Report")]
    public class ReportController : FalconApiController
    {
        private readonly IQuestionReportInquiryProcessor mReportInquiry;
        private readonly IQuestionReportMaintenanceProcessor mReportMaintenance;

        public ReportController(IQuestionReportInquiryProcessor ReportInquiry, IQuestionReportMaintenanceProcessor ReportMaintenance)
        {
            mReportInquiry = ReportInquiry;
            mReportMaintenance = ReportMaintenance;
        }

        [ResponseType(typeof(SReportType[]))]
        [Route("List")]
        [HttpPost]
        public async Task<SReportType[]> GetReportTypes()
        {
            var result = await mReportInquiry.GetReportList();
            return result;
            
        }

        [ResponseType(typeof(bool))]
        [Route("Question")] //TODO Refactor this to packet
        [HttpPost]
        public async Task<bool> ReportQuestion(SReportedQuestion Question)
        {
            if (!ModelState.IsValid)
                return false;
                
            var result = await mReportMaintenance.ReportQuestion(Question);
            return result;

        }
    }
}
