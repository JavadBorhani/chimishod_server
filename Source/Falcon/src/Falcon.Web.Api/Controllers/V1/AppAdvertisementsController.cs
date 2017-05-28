using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
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

        private readonly IAppAdvertsInquiryProcessor mAppAdvertisementsInquiryProcessor;
        private readonly IAppAdvertsMaintenanceProcessor mAppAdvertsMaintenanceProcessor;
        public AppAdvertisementsController(IAppAdvertsInquiryProcessor AppAdvertisementsInquiryProcessor, IAppAdvertsMaintenanceProcessor AppAdvertsMaintenanceProcessor)
        {
            mAppAdvertisementsInquiryProcessor = AppAdvertisementsInquiryProcessor;
            mAppAdvertsMaintenanceProcessor = AppAdvertsMaintenanceProcessor;
        }

        [ResponseType(typeof(SAppAdvert))]
        [Route("AppAdvertisements/")]
        [HttpPost]
        public async Task<List<SAppAdvert>> GetAppList()
        {
            var result = await mAppAdvertisementsInquiryProcessor.GetAdvertList();
            return result;
        }

        [Route("AppAdvertisements/{AdvertID}")]
        [ResponseType(typeof(bool))]
        [HttpPost]
        public async Task<IHttpActionResult> SendPresentedAdvert(int AdvertID)
        {
            var result = await mAppAdvertsMaintenanceProcessor.AddPresentedAdvert(AdvertID);
            return Ok(result);
        }

    }
}
