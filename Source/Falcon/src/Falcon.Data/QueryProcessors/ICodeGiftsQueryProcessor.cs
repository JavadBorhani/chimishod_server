using Falcon.Data;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public interface ICodeGiftsQueryProcessor
    {
        Task<bool> Registered(int ID);
        Task<bool> AddByID(int ID);
        Task<CodeGift> GetByID(int ID);
        Task<bool> IsExpired(int ID);
        Task<CodeGift> ReturnIfExists(string Code);
    }
}