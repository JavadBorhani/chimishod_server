using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Public
{
    public interface IFriendsMaintenanceProcessor
    {
        Task<SFriend> CreateRelation(int FriendID);
        Task<SFriend> UpdateRelation(int FriendID, RelationStatus Status);
        Task<SFriend> DeleteRelation(int FriendID);
    }
}