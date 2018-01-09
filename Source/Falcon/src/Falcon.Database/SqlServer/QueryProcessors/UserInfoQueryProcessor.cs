using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserInfoQueryProcessor : IUserInfoQueryProcessor
    {
        private readonly IDbContext mDB;
        private readonly IDateTime mDateTime;

        public UserInfoQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDB = Database;
            mDateTime = DateTime;
        }
        public async Task<bool> CreateEmptyUserInfo(int UserID)
        {
            mDB.Set<UserInfo>().Add(new UserInfo
            {
                UserID = UserID,
                RegisterDateTime = mDateTime.Now,
            });

            await mDB.SaveChangesAsync();
            return true;
        }
    }
}
