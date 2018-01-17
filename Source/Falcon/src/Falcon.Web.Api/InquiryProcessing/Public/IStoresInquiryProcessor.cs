// Flapp Copyright 2017-2018
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IStoresInquiryProcessor
    {
        Task<SStore[]> GetStoreList(int StoreKey);
    }
}