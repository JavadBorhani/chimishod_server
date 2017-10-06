using Falcon.Web.Models.Api.Config;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IGameConfigInquiryProcessor
    {
        Task<SQuestionSelectorConfig> GetQuestionSelectorConfig();

    }
}
