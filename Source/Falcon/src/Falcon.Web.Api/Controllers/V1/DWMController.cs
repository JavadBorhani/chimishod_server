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
    public class DWMController : FalconApiController
    {
        private readonly IDWMMaintenanceProcessor mDWMMaintenanceProcessor;
        private readonly IDWMInquiryProcessor mDWMInquiryProcessor;
        public DWMController(IDWMMaintenanceProcessor DWMMaintenanceProcessor , IDWMInquiryProcessor DWMInquiryProcessor)
        {
            mDWMMaintenanceProcessor = DWMMaintenanceProcessor;
            mDWMInquiryProcessor = DWMInquiryProcessor;
        }

        [ResponseType(typeof(SDailyReward))]
        [Route("DWM/")]        
        [HttpPost]
        public async Task<List<SDailyReward>> GetDailyReward()
        {
            var result = await mDWMInquiryProcessor.GetDailyRewardList();
            return result;   
        }

        [Route("DWM/Achieve/{DWMRewardID}")]
        [HttpPost]
        public async Task<SEarnRewardValidation> EarnDay(int DWMRewardID)
        {
            var result = await mDWMMaintenanceProcessor.CollectDayReward(DWMRewardID);
            return Ok(result);
        }
    }
}
