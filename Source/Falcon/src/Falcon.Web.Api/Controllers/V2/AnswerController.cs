using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Answer;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class AnswerController : FalconApiController
    {

        private readonly IAnswerMaintenanceProcessor mAnswerMaintenance;
        private readonly IAnswerInquiryProcessor mAnswerInquiry;

        public AnswerController(IAnswerInquiryProcessor AnswerInquiry , IAnswerMaintenanceProcessor AnswerMaintenance)
        {
            mAnswerInquiry = AnswerInquiry;
            mAnswerMaintenance = AnswerMaintenance;
        }

        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Answer/Full/")]
        [HttpPost]
        public async Task<IHttpActionResult> SendFullAnswer(SAnswer Answer)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var response = await mAnswerMaintenance.SaveAnswer(Answer);

            return Ok(response);
        }

        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Answer/Yes/")]
        [HttpPost]
        public async Task<IHttpActionResult> SendYesNoAnswer(SYesNoAnswer Response)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var response = await mAnswerMaintenance.SaveYesNoAnswer(Response);

            return Ok(response);

        }

        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Answer/Like/")]
        [HttpPost]
        public async Task<IHttpActionResult> SendLikeAndDislike(SLikeDislikeAnswer Response)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var response = await mAnswerMaintenance.SaveLikeDislikeAnswer(Response);

            return Ok(response);
        }


    }
}
