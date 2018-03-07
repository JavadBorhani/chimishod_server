using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class CategoriesMaintenanceProcessor : ICategoriesMaintenanceProcessor
    {
        private readonly ICategoriesQueryProcessor mCategoriesQueryProcessor;
        public CategoriesMaintenanceProcessor(ICategoriesQueryProcessor CategoriesQueryProcessor)
        {
            mCategoriesQueryProcessor = CategoriesQueryProcessor;
        }
        public async Task<bool> PurchaseFreeItem(int ID)
        {
            var exists = await mCategoriesQueryProcessor.IsExists(ID);
            if(exists)
            {
                var purchased = await mCategoriesQueryProcessor.IsPurchased(ID);
                if (!purchased)
                {
                    await mCategoriesQueryProcessor.PurchaseItem(ID);
                    return true;
                }
                return purchased;
            }
            return false;
        }
    }
}