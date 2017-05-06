using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V1
{
    public class AppAdvertisementsController : FalconApiController
    {

        private readonly IAppAdvertisementsInquiryProcessor mAppAdvertisementsInquiryProcessor;
        public AppAdvertisementsController(IAppAdvertisementsInquiryProcessor AppAdvertisementsInquiryProcessor)
        {
            mAppAdvertisementsInquiryProcessor = AppAdvertisementsInquiryProcessor;
        }

        [ResponseType(typeof(SAppAdvert))]
        [Route("AppAdvertisements/")]
        [HttpPost]

        public async Task<List<SAppAdvert>> GetAppList()
        {
            var result = await mAppAdvertisementsInquiryProcessor.GetAdvertList();
            return result;
        }
    }
}
