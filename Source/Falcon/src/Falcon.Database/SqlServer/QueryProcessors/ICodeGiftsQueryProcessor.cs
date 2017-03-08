using Falcon.Data;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public interface ICodeGiftsQueryProcessor
    {
        Task<SCodeGift> GetCodeGift(int ID);
    }
}