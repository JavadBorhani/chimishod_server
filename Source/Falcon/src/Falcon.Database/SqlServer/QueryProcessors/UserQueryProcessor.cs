using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class UserQueryProcessor : IUserQueryProcessor
    {

        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        public UserQueryProcessor(IDbContext Database , IWebUserSession UserSession)
        {
            mDb = Database;
            mUserSession = UserSession;
        }
        public async Task<int> AddCoin(int Coin)
        {
            if (Coin < 0)
                return -1; 
            //TODO : Checkout Threading 
            var user = await mDb.Set<User>().Where(u => u.ID == mUserSession.ID).SingleOrDefaultAsync();
            user.TotalStars += Coin;

            await mDb.SaveChangesAsync();
            return user.TotalStars;
        }
    }
}
