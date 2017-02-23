using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace Falcon.Web.Api.Utilities.Extentions
{
    public class FalconApiController : ApiController
    {
        public ResponseMessageResult Response(HttpStatusCode Code)
        {
            return ResponseMessage(Request.CreateResponse(Code));
        }

        public ResponseMessageResult Response(HttpStatusCode Code, object DataToSend)
        {
            return ResponseMessage(Request.CreateResponse(Code, DataToSend));
        }
    }
}
