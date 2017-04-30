using Falcon.Web.Api.WatchAd.Private;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.WatchAd.Public
{
    public interface IWatchAdValidator
    {
        Task<ResponseToken> ValidateWatchAd(string ProviderUri, RequestToken RequestToken);
    }
}