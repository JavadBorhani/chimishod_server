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
        //TODO: Find a solution for getting objectName
        //public ResponseMessageResult Response(HttpStatusCode Code, object Data1 , object Data2)
        //{
        //    return ResponseMessage(Request.CreateResponse(Code, new { Data1.GetType().Name, Data2 }));
        //}

        //public ResponseMessageResult Response(HttpStatusCode Code, object Data1, object Data2 , object Data3)
        //{
        //    return ResponseMessage(Request.CreateResponse(Code, new { Data1, Data2 , Data3 }));
        //}

        //public ResponseMessageResult Response(HttpStatusCode Code, object Data1, object Data2, object Data3 , object Data4)
        //{
        //    return ResponseMessage(Request.CreateResponse(Code, new { Data1, Data2, Data3 , Data4 }));
        //}

        //public ResponseMessageResult Response(HttpStatusCode Code, object Data1, object Data2, object Data3, object Data4 , object Data5)
        //{
        //    return ResponseMessage(Request.CreateResponse(Code, new { Data1, Data2, Data3, Data4 , Data5 }));
        //}
    }
}
