using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class WatchAdMaintenanceProcessor : IWatchAdMaintenanceProcessor
    {
        public async Task<int> ValidateWatchAd(SWatchAdValidation WatchAdValidation)
        {
            throw new NotImplementedException();
        }
    }
}