using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IFriendsQueryProcessor
    {
        Task<int[]> GetFriendIds();
        Task<SFriend> GetAllFriendList();

    }
}
