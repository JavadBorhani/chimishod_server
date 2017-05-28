using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class SpinWheelController : FalconApiController
    {

        private readonly ISpinWheelInquiryProcessor mSpinWheelInquiryProcessor;
        private readonly ISpinWheelMaintenanceProcessor mSpinWheelMaintenanceProcessor;
        public SpinWheelController(ISpinWheelInquiryProcessor SpinWheelInquiryProcessor, ISpinWheelMaintenanceProcessor SpinWheelMaintenanceProcessor)
        {
            mSpinWheelInquiryProcessor = SpinWheelInquiryProcessor;
            mSpinWheelMaintenanceProcessor = SpinWheelMaintenanceProcessor;
        }

        [Route("SpinWheel/")]
        [HttpPost]
        public async Task<IList<SSpinWheel>> GetSpinWheelList()
        {
            var result = await mSpinWheelInquiryProcessor.GetSpinWheelList();
            return result;  
        }


        [Route("SpinWheel/Achieve/{SpinWheelID}")]
        [HttpPost]
        public async Task<SAchieveSpinWheelValidation> GetSpinWheelList(int SpinWheelID)
        {
            var result = await mSpinWheelMaintenanceProcessor.AchieveSpinWheel(SpinWheelID);
            return result;
        }
    }
}
