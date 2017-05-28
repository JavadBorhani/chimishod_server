using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IItemPurchaseManager
    {
        Task<bool> PurchaseTheme(int ID);
        Task<bool> PurchaseCategory(int ID );
        Task<bool> PurchaseAvatar(int ID );
    }
}