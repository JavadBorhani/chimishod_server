using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.User;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]

    public class InitializationController : FalconApiController
    {
        private readonly IInitializationInquiryProcessor mInitInquiry;
        public InitializationController(IInitializationInquiryProcessor InitializationInquiry)
        {
            mInitInquiry = InitializationInquiry;
        }

        [ResponseType(typeof(SUserInitializationData))]
        [Route("v2/Initialize/{LevelVersionCode}")]
        [HttpPost]
        public async Task<SUserInitializationData> LoadingUserData(int LevelVersionCode)
        {
            var data = await mInitInquiry.LoadUserData(LevelVersionCode);
            return data;
        }



    }
}
