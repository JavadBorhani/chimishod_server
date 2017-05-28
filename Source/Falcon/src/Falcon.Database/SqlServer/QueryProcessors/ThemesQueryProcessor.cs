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
    public class ThemesQueryProcessor : IThemesQueryProcessor
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
        public async Task<bool> PurchaseItem(int ID)
        {
            if (ID == Constants.DefaultUser.AppThemeID)
                return true;

            mDb.Set<PurchaseTheme>().Add(new PurchaseTheme
            {
                ThemeID = ID,
                PurchaseDate = mDateTime.Now,
                UserID = mUserSession.ID,
            });

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<bool> IsPurchased(int ID)
        {
            if (ID == Constants.DefaultUser.AppThemeID)
                return true;

            var result = await mDb.Set<PurchaseTheme>().AsNoTracking().CountAsync(pt => pt.ThemeID == ID) > 0;
            return result;            
        }
    }
}
