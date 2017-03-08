using Falcon.Data;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public interface ICodeGiftsQueryProcessor
    {
        Task<CodeGift> GetCodeGift(int ID);
        //test
    }
}