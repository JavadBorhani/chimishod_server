using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IUserInfoQueryProcessor
    {
        Task<bool> CreateEmptyUserInfo(int UserID);
    }
}
