using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserStatQueryProcessor : IUserStatQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        public UserStatQueryProcessor(IDbContext Database , IUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
        public async Task<bool> AddFortune(int Amount)
        {
            var userStat = await mDb.Set<UserStat>().FirstOrDefaultAsync(us => us.UserID == mUserSession.ID);
            userStat.SpinRemainedChance += Amount;

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<UserStat> GetById(int ID)
        {
            var result =  await mDb.Set<UserStat>().AsNoTracking().FirstOrDefaultAsync(us => us.ID == ID);
            return result;
        }
    }
}
