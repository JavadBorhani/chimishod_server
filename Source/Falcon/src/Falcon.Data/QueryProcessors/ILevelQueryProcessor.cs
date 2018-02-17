using Falcon.Web.Models.Api.Level;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ILevelQueryProcessor
    {
        Task<SLevel[]> GetAll();
        Task<int> GetLevelQuest(int LevelID);
    }
}
