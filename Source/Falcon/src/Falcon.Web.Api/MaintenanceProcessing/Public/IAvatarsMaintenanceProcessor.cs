using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IAvatarsMaintenanceProcessor
    {
        Task<bool> PurchaseFreeItem(int ID);
    }
}
