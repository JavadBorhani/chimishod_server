using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Polling;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{

    public class PollingController : FalconApiController
    {

        private readonly IPollingInquiryProcessor mPollingProcessor;
        private readonly IDateTime mDateTime;

        public PollingController(IPollingInquiryProcessor PollingProcessor , IDateTime DateTime)
        {
            mPollingProcessor = PollingProcessor;
            mDateTime = DateTime;
        }



        [ResponseType(typeof(IHttpActionResult))]
        [Route("v2/Polling/")]
        [HttpPost]
        public async Task<IHttpActionResult> LongPolling(SPollingInquiry Inquiry)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var lastData = await mPollingProcessor.PollingMainRequests(Inquiry);

            var response = new DataWithServerTime<SClientPollingData>
            {
                Data = lastData,
                ServerTime = mDateTime.Now
            };

            return Ok(response);
        }

    }
}
