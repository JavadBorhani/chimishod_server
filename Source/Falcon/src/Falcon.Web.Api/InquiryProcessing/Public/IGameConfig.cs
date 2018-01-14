using Falcon.Web.Api.Utilities;
using Falcon.Web.Models.Api.Config;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface IGameConfig : IInMemory<SGameConfig>
    {        
        SGameConfig GetQuestionSelectorConfig();
    }
}
