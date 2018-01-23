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
            var relations = await GetFriendRelationship();



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

        public async Task<Relationship[]> GetFriendRelationship()
        {
            var relation = await mDb.Set<Relationship>()
                .AsNoTracking()
                .Where(u => u.UserOneID == mUserSession.ID || u.UserTwoID == mUserSession.ID)
                .ToArrayAsync();


            return relation;

        }

        public async Task<int[]> GetAllFriendIds()
        {
            var friends = await mDb.Set<Relationship>()
                .AsNoTracking()
                .Where(r => r.UserOneID == mUserSession.ID || r.UserOneID == mUserSession.ID)
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
    }
}
