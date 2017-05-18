using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    
    public class DWMMaintenanceProcessor : IDWMMaintenanceProcessor
    {
        private readonly IDWMQueryProcessor mDWMQueryProcessor;
        public DWMMaintenanceProcessor(IDWMQueryProcessor DWMQueryProcessor)
        {
            mDWMQueryProcessor = DWMQueryProcessor; 
        }
    }
}