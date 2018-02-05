using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V2
{
    [RoutePrefix("v2/Level/")]
    [UnitOfWorkActionFilter]
    public class LevelController : FalconApiController
    {
        private readonly ILevelInquiryProcessor mLevelInquiry;
        public LevelController(ILevelInquiryProcessor LevelInquiry)
        {
            mLevelInquiry = LevelInquiry;
        }
      
    }
}
