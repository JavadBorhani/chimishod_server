using Falcon.Common.Logging;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using log4net;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class TestController : FalconApiController
    {
        private readonly IDbContext mContext;
        private readonly ILog mLogger;
        
        public TestController(IDbContext Context , ILogManager Logger)
        {
            mContext = Context;
            mLogger = Logger.GetLog(typeof(TestController));
        }

        [Route("v2/TestController/{QuestionID}/{State}")]
        [HttpPost]
        public IHttpActionResult GetInfo(int QuestionID , int State)
        {
            mLogger.Warn("I Have got information about" + QuestionID + " State : " + State);
            return Ok(WebContextModelFactory.ConnectionCount);
        }

    }
}