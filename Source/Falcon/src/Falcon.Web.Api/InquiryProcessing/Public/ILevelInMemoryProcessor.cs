using Falcon.Web.Models.Api.Cache;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface ILevelInMemoryProcessor
    {
        Task<SLevelCache[]> GetLevelInfos();
        Task<bool> ReadStateFromDB();
    }
}
