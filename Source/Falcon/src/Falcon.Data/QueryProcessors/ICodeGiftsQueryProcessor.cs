using Falcon.Data;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public interface ICodeGiftsQueryProcessor
    {
        Task<bool> HasGotCodeGift(int ID);
        Task<bool> AddCodeGiftByID(int ID);
        Task<CodeGift> GetCodeGiftByID(int ID);
        Task<bool> IsExpired(int ID);
    }
}