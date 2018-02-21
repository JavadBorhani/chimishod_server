using Falcon.Web.Models.Api.Polling;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IPollingInquiryProcessor
    {
        Task<SClientPollingData> PollingMainRequests(SPollingInquiry PollingInquiry);
    }
}
