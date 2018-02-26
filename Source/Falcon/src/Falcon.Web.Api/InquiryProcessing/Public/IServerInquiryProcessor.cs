using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IServerInquiryProcessor
    {
        Task<bool> ReadConfigurationFilesFromServer();
    }
}