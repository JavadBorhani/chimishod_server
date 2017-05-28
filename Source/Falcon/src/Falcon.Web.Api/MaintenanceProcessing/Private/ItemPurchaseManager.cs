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
        
        public async Task<bool> PurchaseFreeAvatar(int ID)
        {
            var result = await mAvatarsMaintenanceProcessor.PurchaseFreeItem(ID);
            return result;
        }


        public async Task<bool> PurchaseFreeCategory(int ID)
        {
            var result = await mCategoriesMaintenanceProcessor.PurchaseFreeItem(ID);
            return result;  
        }

        public async Task<bool> PurchaseFreeTheme(int ID)
        {
            var result = await mThemesMaintenanceProcessor.PurchaseFreeItem(ID);
            return result;  
        }
    }
}