using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserInfoQueryProcessor : IUserInfoQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;

        public UserInfoQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDb = Database;
            mDateTime = DateTime;
        }
        public async Task<bool> CreateEmptyUserInfo(int UserID)
        {
            mDb.Set<UserInfo>().Add(new UserInfo
            {
                UserID = UserID,
                RegisterDateTime = mDateTime.Now,
                IsInfoEnable = false,
            });

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<SUserInfo> GetLoginInfoByEmail(SGoogleAuthentication Info)
        {
            var userInfo = await mDb.Set<UserInfo>().AsNoTracking()
                                    .Where(u => u.Email == Info.Email && u.IsInfoEnable == true)
                                    .Include(u => u.User)
                                    .Select(u => new SUserInfo
                                    {
                                        UserName =  u.User.UserName,
                                        Password =  u.Password
                                    })
                                    .SingleOrDefaultAsync();

            return userInfo;

        }
    }
}
