﻿using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Friend;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IFriendsQueryProcessor
    {
        Task<Relationship[]> GetAllFriendRelationship();
        Task<SFriend[]> GetAllFriendList();
        Task<int[]> GetAllFriendIds();
        Task<bool> CreateRelation(int FriendID);
        Task<bool> DeleteRelation(int FriendID);
        Task<Relationship> GetFriendRelationshipAsNoTracking(int FriendID);
        Task<bool> UpdateRelationship(int FriendID, RelationStatus Status);
        
    }
}
