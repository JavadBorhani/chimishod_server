using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

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

        [Route("DWM/")]        
        [HttpPost]
        public async Task<IHttpActionResult> GetDailyReward()
        {
            return null;    
        }

        [Route("DWM/Achieve/{DWMDay}")]
        [HttpPost]
        public async Task<IHttpActionResult> EarnDay(int DWMDay)
        {
            return null;
        }
    }
}
