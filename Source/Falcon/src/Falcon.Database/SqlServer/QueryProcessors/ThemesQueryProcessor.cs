using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class ThemesQueryProcessor /*: IThemesQueryProcessor*/
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;

        public ThemesQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }
        //public async Task<bool> PurchaseItem(int ID)
        //{
        //    if (ID == Constants.DefaultUser.AppThemeID)
        //        return true;

        //    mDb.Set<PurchaseTheme>().Add(new PurchaseTheme
        //    {
        //        ThemeID = ID,
        //        PurchaseDate = mDateTime.Now,
        //        UserID = mUserSession.ID,
        //    });

        //    await mDb.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<bool> IsPurchased(int ID)
        //{
        //    if (ID == Constants.DefaultUser.AppThemeID)
        //        return true;

        //    var result = await mDb.Set<PurchaseTheme>().AsNoTracking().CountAsync(pt => pt.ThemeID == ID && pt.UserID == mUserSession.ID) > 0;
        //    return result;            
        //}

        //public async Task<bool> IsExists(int ID)
        //{
        //    var exists = await mDb.Set<AppTheme>().AsNoTracking().CountAsync(at => at.ID == ID) > 0;
        //    return exists;
        //}
    }
}
