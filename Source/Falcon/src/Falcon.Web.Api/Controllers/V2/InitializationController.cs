using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Initialize;
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
        [Route("v2/Initialize/")]
        [HttpPost]
        public async Task<SUserInitializationData> LoadingUserData(SInitializeInquiry Inquiry)
        {
            if (!ModelState.IsValid)
                return null;

            var data = await mInitInquiry.LoadUserData(Inquiry);
            return data;
        }


        [ResponseType(typeof(bool))]
        [Route("v2/ServerConfig/")]
        [HttpPost]
        public bool ReloadServerConfigFiles()
        {
            var response = mInitInquiry.ReloadServerConfig();
            return response;
        }


    }
}
