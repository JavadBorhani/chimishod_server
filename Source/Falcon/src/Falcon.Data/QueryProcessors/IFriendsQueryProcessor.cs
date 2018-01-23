using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IFriendsQueryProcessor
    {
        Task<Relationship[]> GetFriendRelationship();
        Task<SFriend[]> GetAllFriendList();
        Task<int[]> GetAllFriendIds();
    }
}
