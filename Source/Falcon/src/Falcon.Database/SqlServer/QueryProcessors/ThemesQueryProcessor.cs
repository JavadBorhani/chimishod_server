using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
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
            mDb.Set<PurchaseTheme>().Add(new PurchaseTheme
            {
                ThemeID = ID,
                PurchaseDate = mDateTime.Now,
                UserID = mUserSession.ID,
            });

            await mDb.SaveChangesAsync();
            return true;
        }
    }
}
