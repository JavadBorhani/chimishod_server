using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IWatchAdQueryProcessor
    {
        Task<bool> IsExists(string WatchAdId);
        Task<bool> AddWatchedInfo(SWatchedAd WatchedAd);
    }
}
