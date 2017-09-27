using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Cache;
using Falcon.Web.Models.Api.Level;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface ILevelInquiryProcessor
    {
        Task<SLevelCache[]> GetLevelInfos();
        Task<bool> ReadStateFromDB();
    }
}
