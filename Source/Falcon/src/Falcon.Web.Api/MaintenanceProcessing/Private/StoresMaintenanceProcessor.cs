using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Web.Api.Security.Public;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class StoresMaintenanceProcessor : IStoresMaintenanceProcessor
    {

        private readonly IMarketVerificationProcessor mMarketVerificationProcessor;
        private readonly IStoresQueryProcessor mStoresQueryProcessor;

        public StoresMaintenanceProcessor(IMarketVerificationProcessor MarketVerificationProcessor , IStoresQueryProcessor StoresQueryProcessor)
        {
            mMarketVerificationProcessor = MarketVerificationProcessor;
            mStoresQueryProcessor = StoresQueryProcessor;
        }

        public Task<bool> VerifyPurchase(SHardCurrency HardCurrency)
        {

        }
    }
}