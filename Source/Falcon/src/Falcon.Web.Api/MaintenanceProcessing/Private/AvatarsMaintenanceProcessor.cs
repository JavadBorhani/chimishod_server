using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AvatarsMaintenanceProcessor : IAvatarsMaintenanceProcessor
    {
        private readonly IAvatarsQueryProcessor mAvatarsQueryProcessor;
        public AvatarsMaintenanceProcessor(IAvatarsQueryProcessor AvatarsQueryProcessor)
        {
            mAvatarsQueryProcessor = AvatarsQueryProcessor;
        }
        public async Task<bool> PurchaseFreeItem(int ID)
        {
            var exists = await mAvatarsQueryProcessor.IsExists(ID);
            if (exists)
            {
                var purchased = await mAvatarsQueryProcessor.IsPurchased(ID);
                if (!purchased)
                {
                    await mAvatarsQueryProcessor.PurchaseItem(ID);
                    return true;
                }
                return purchased;
            }
            return false;
        }
    }
}