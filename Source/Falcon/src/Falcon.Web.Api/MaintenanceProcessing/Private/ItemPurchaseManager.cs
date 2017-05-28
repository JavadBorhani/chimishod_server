using Falcon.Web.Api.MaintenanceProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class ItemPurchaseManager : IItemPurchaseManager
    {
        private readonly IAvatarsMaintenanceProcessor mAvatarsMaintenanceProcessor;
        private readonly ICategoriesMaintenanceProcessor mCategoriesMaintenanceProcessor;
        private readonly IThemesMaintenanceProcessor mThemesMaintenanceProcessor;
        public ItemPurchaseManager(
            IAvatarsMaintenanceProcessor AvatarsMaintenanceProcessor , 
            ICategoriesMaintenanceProcessor CategoriesMaintenanceProcessor,
            IThemesMaintenanceProcessor ThemesMaintenanceProcessor)
        {
            mAvatarsMaintenanceProcessor = AvatarsMaintenanceProcessor;
            mCategoriesMaintenanceProcessor = CategoriesMaintenanceProcessor;
            mThemesMaintenanceProcessor = ThemesMaintenanceProcessor;
        }
        
        public Task<bool> PurchaseAvatar(int ID)
        {
            throw new NotImplementedException();
        }

        
        public Task<bool> PurchaseCategory(int ID)
        {
            throw new NotImplementedException();
        }

        public Task<bool> PurchaseTheme(int ID)
        {
            throw new NotImplementedException();
        }
    }
}