using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Friend;
using System;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IFriendsQueryProcessor
    {
        Task<Relationship[]> GetAllFriendRelationship();
        Task<SFriend[]> GetAllFriendList();
        Task<SFriend[]> GetAllFriendFromDateUpToNow(DateTime DateTime);
        Task<int[]> GetAllFriendIds();
        Task<bool> CreateRelation(int FriendID);
        Task<bool> DeleteRelation(int FriendID);
        Task<Relationship> GetFriendRelationshipAsNoTracking(int FriendID);
        Task<bool> UpdateRelationship(int FriendID, RelationStatus Status);
        Task<bool> HasFriends(int[] FriendIds);
    }
}
