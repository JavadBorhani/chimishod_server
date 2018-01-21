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
        public async Task<SFriend> GetAllFriendList()
        {
            return null;
        }

        public async Task<int[]> GetFriendIds()
        {
            var relationIds = await mDb.Set<Relationship>()
                .AsNoTracking()
                .Where(u => u.UserOneID == mUserSession.ID || u.UserTwoID == mUserSession.ID)
                .Select(relation => new
                {
                    relation.UserOneID,
                    relation.UserTwoID
                }).ToArrayAsync();

            var ids = new int[relationIds.Length];

            for(int i =  0; i < relationIds.Length; ++i)
            {
                ids[i] = (relationIds[i].UserOneID == mUserSession.ID ? relationIds[i].UserTwoID : relationIds[i].UserOneID); // finding relative user friend
            }

            return ids;
        }
    }
}
