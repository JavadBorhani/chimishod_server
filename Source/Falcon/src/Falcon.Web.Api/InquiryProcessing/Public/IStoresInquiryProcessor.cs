using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IStoresInquiryProcessor
    {
        Task<List<SStore>> GetStoreList(int StoreKey);
    }
}