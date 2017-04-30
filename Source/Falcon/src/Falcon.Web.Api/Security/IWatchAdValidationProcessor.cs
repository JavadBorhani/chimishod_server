using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.Security
{
    public interface IWatchAdValidationProcessor
    {
        Task<int> ValidateWatchAd(SWatchAdValidation WatchAdValidation);
    }
}