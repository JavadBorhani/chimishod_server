using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IUserInfoQueryProcessor
    {
        Task<bool> CreateEmptyUserInfo(int UserID);
        Task<SUserInfo> GetLoginInfoByEmail(SGoogleAuthentication Info);
    }
}
