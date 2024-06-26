﻿using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class AvatarsQueryProcessor /*: IAvatarsQueryProcessor*/
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
        //public async Task<bool> PurchaseItem(int ID)
        //{
        //    if (ID == Constants.DefaultUser.AvatarID)
        //        return true;

        //    mDb.Set<PurchaseAvatar>().Add(new PurchaseAvatar
        //    {
        //        UserAvatarID = ID,
        //        PurchasedDate = mDateTime.Now,
        //        UserID = mUserSession.ID,
        //    });

        //    await mDb.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<bool> IsPurchased(int ID)
        //{
        //    if (ID == Constants.DefaultUser.AvatarID)
        //        return true;

        //    var result = await mDb.Set<PurchaseAvatar>().AsNoTracking().CountAsync(pt => pt.UserAvatarID == ID && pt.UserID == mUserSession.ID) > 0;
        //    return result;
        //}

        //public async Task<bool> IsExists(int ID)
        //{
        //    var exists = await mDb.Set<UserAvatar>().AsNoTracking().CountAsync(at => at.ID == ID) > 0 ;
        //    return exists;
        //}
    }
}
