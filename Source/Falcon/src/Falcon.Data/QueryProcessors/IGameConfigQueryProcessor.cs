using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Config;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IGameConfigQueryProcessor
    {
        Task<GameConfig> GetGameConfiguration();
        Task<bool> SetGameConfiguration(SGameConfig Config);
    }
}
