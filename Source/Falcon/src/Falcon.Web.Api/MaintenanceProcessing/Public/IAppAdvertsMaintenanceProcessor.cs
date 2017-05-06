using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IAppAdvertsMaintenanceProcessor
    {
        Task<bool> AddPresentedAdvert(int ID);
    }
}