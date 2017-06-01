using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Security.Private;
using Falcon.Web.Api.Security.Public;
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
        private readonly IEncryptor mNumberEncyptor; 
        public SpinWheelController(
            ISpinWheelInquiryProcessor SpinWheelInquiryProcessor, 
            ISpinWheelMaintenanceProcessor SpinWheelMaintenanceProcessor , 
            IEncryptor NumberEncryptor)
        {
            mSpinWheelInquiryProcessor = SpinWheelInquiryProcessor;
            mSpinWheelMaintenanceProcessor = SpinWheelMaintenanceProcessor;
            mNumberEncyptor = NumberEncryptor;
        }

        [Route("SpinWheel/")]
        [HttpPost]
        public async Task<IList<SSpinWheel>> GetSpinWheelList()
        {
            var result = await mSpinWheelInquiryProcessor.GetSpinWheelList();
            return result;  
        }


        [Route("SpinWheel/Achieve/")]
        [HttpPost]
        public async Task<SAchieveSpinWheelValidation> CollectSpinWheel([FromBody] SpinItem Spin)
        {
            if(ModelState.IsValid)
            {
                var item = mNumberEncyptor.DecryptInt(Spin.SpinWheelID);
                if (item != -1)
                {
                    var result = await mSpinWheelMaintenanceProcessor.AchieveSpinWheel(item);
                    return result;
                }
            }
            return null;
        }
    }
}
