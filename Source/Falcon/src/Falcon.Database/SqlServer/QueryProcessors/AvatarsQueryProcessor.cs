using Falcon.Common;
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

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AvatarsQueryProcessor : IAvatarsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;
        
        public AvatarsQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime )
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }
        public async Task<bool> PurchaseItem(int ID)
        {
            if (ID == Constants.DefaultUser.AvatarID)
                return true;

            mDb.Set<PurchaseAvatar>().Add(new PurchaseAvatar
            {
                UserAvatarID = ID,
                PurchasedDate = mDateTime.Now,
                UserID = mUserSession.ID,
            });

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<bool> IsPurchased(int ID)
        {
            if (ID == Constants.DefaultUser.AvatarID)
                return true;

            var result = await mDb.Set<PurchaseAvatar>().AsNoTracking().CountAsync(pt => pt.UserAvatarID == ID) > 0;
            return result;
        }
    }
}
