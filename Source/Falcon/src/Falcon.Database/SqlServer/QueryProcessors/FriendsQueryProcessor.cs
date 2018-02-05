using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Friend;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class FriendsQueryProcessor : IFriendsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;
        public FriendsQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }
        public async Task<SFriend[]> GetAllFriendList()
        {
            var relations = await GetAllFriendRelationship();

            var friends = new SFriend[relations.Length];

            for (int i = 0; i < relations.Length; ++i)
            {
                friends[i] = new SFriend();
                friends[i].UserID = (relations[i].UserOneID == mUserSession.ID ? relations[i].UserTwoID : relations[i].UserOneID);
                friends[i].RelationOperatorIsMe = (relations[i].OperatedByID == mUserSession.ID ? true : false);
                friends[i].Status = (RelationStatus)relations[i].RelationStatus;
            }

            var friendIds = friends.Select(f => f.UserID).ToArray();

            var infos = await mDb.Set<User>()
                .AsNoTracking()
                .Where(u => friendIds.Contains(u.ID))
                .Select( u => new
                {
                    u.ID,
                    u.UserName ,
                    u.AvatarImagePath
                })
                .ToArrayAsync();

            var result = infos
                .Join(friends, s => s.ID, u => u.UserID, (user, relation) => new SFriend
                {
                    UserID = user.ID,
                    UserName = user.UserName,
                    UserPictureUrl = user.AvatarImagePath,
                    Status = relation.Status,
                    RelationOperatorIsMe = relation.RelationOperatorIsMe,
                })
                .ToArray();

            return result;

        }

        public async Task<Relationship[]> GetAllFriendRelationship()
        {
            var relation = await mDb.Set<Relationship>()
                .AsNoTracking()
                .Where(u => u.UserOneID == mUserSession.ID || u.UserTwoID == mUserSession.ID && u.RelationStatus != (int)RelationStatus.Blocked)
                .ToArrayAsync();


            return relation;

        }

        public async Task<int[]> GetAllFriendIds()
        {
            var friends = await mDb.Set<Relationship>()
                .AsNoTracking()
                .Where(r => r.UserOneID == mUserSession.ID || r.UserTwoID == mUserSession.ID && r.RelationStatus != (int)RelationStatus.Blocked)
                .Select(r => new
                {
                    r.UserOneID,
                    r.UserTwoID
                })
                .ToArrayAsync();

            int[] friendIds = new int[friends.Length];

            for (int i = 0; i < friendIds.Length; ++i)
            {
                friendIds[i] = (friends[i].UserOneID == mUserSession.ID ? friends[i].UserTwoID : friends[i].UserOneID);
            }
            return friendIds;

        }

        public async Task<bool> CreateRelation(int FriendID)
        {
            var userOneID = (mUserSession.ID > FriendID ? FriendID : mUserSession.ID);
            var userTwoID = (mUserSession.ID > FriendID ? mUserSession.ID : FriendID);

            var friend = await GetFriendRelationship(FriendID);
            

            if(friend != null)
            {
                if(friend.RelationStatus == (int)RelationStatus.Rejected)
                {
                    friend.RelationStatus = (int)RelationStatus.Pending;
                    friend.OperatedByID = mUserSession.ID;

                    try
                    {
                        await mDb.SaveChangesAsync();
                        return true;
                    }
                    catch
                    {
                        return false;
                    }
                }
                return false;
            }

            mDb.Set<Relationship>().Add(new Relationship
            {
               UserOneID = userOneID,
               UserTwoID = userTwoID,
               OperatedByID = mUserSession.ID,
               RelationStatus = (int)RelationStatus.Pending 
            });

            try
            {
                await mDb.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<Relationship> GetFriendRelationshipAsNoTracking(int FriendID)
        {
            var userOneID = (mUserSession.ID > FriendID ? FriendID : mUserSession.ID);
            var userTwoID = (mUserSession.ID > FriendID ? mUserSession.ID : FriendID);

            var relation = await mDb.Set<Relationship>()
                .AsNoTracking()
                .Where(r => r.UserOneID == userOneID && r.UserTwoID == userTwoID && r.OperatedByID != (int)RelationStatus.Blocked)
                .SingleOrDefaultAsync();

            return relation;
        }

        private async Task<Relationship> GetFriendRelationship(int FriendID)
        {
            var userOneID = (mUserSession.ID > FriendID ? FriendID : mUserSession.ID);
            var userTwoID = (mUserSession.ID > FriendID ? mUserSession.ID : FriendID);

            var relation = await mDb.Set<Relationship>()
                .Where(r => r.UserOneID == userOneID && r.UserTwoID == userTwoID && r.OperatedByID != (int)RelationStatus.Blocked)
                .SingleOrDefaultAsync();

            return relation;
        }

        public async Task<bool> UpdateRelationship(int FriendID, RelationStatus Status)
        {
            var userOneID = (mUserSession.ID > FriendID ? FriendID : mUserSession.ID);
            var userTwoID = (mUserSession.ID > FriendID ? mUserSession.ID : FriendID);

            var relation = await mDb.Set<Relationship>()
                .Where(r => r.UserOneID == userOneID && r.UserTwoID == userTwoID)
                .SingleOrDefaultAsync();

            relation.RelationStatus = (int)Status;
            relation.OperatedByID = (int)mUserSession.ID;   

            try
            {
                await mDb.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<bool> DeleteRelation(int FriendID)
        {
            var userOneID = (mUserSession.ID > FriendID ? FriendID : mUserSession.ID);
            var userTwoID = (mUserSession.ID > FriendID ? mUserSession.ID : FriendID);

            var relation = await mDb.Set<Relationship>()
              .Where(r => r.UserOneID == userOneID && r.UserTwoID == userTwoID)
              .SingleOrDefaultAsync();
            mDb.Set<Relationship>().Remove(relation);
            
            try
            {
                await mDb.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;   
            }
        }

        public async Task<bool> HasFriends(int[] FriendIds)
        {
            //TODO : find better solution for a pair of friend check 
            var friends = await GetAllFriendIds();
            var exists = !FriendIds.Except(friends).Any(); 
            return exists;
        }
    }
}
