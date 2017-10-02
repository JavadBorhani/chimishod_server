using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AnswerMaintenanceProcessor : IAnswerMaintenanceProcessor
    {
        public async Task<bool> Answer(SAnswer Answer)
        {
            return false;
        }
    }
}