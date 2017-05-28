using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IItemPurchaseManager
    {
        Task<bool> PurchaseFreeTheme(int ID);
        Task<bool> PurchaseFreeCategory(int ID );
        Task<bool> PurchaseFreeAvatar(int ID );
    }
}