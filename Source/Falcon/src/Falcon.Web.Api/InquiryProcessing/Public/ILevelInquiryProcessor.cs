using Falcon.Web.Models.Api.Level;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface ILevelInquiryProcessor
    {
        Task<SLevel[]> GetLevelList();
    }
}