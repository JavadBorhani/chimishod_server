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
    public class CategoriesQueryProcessor : ICategoriesQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IUserSession mUserSession;
        private readonly IDateTime mDateTime;
        public CategoriesQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }
        public async Task<bool> PurchaseItem(int ID)
        {
            if (ID == Constants.DefaultUser.CategoryID)
                return true;

            mDb.Set<PurchaseCategory>().Add(new PurchaseCategory
            {
                CategoryID = ID,
                PurchaseDate = mDateTime.Now,
                UserID = mUserSession.ID,
            });

            await mDb.SaveChangesAsync();
            return true;
        }

        public async Task<bool> IsPurchased(int ID)
        {
            if (ID == Constants.DefaultUser.CategoryID)
                return true;

            var result = await mDb.Set<PurchaseCategory>().AsNoTracking().CountAsync(pt => pt.CategoryID == ID && pt.UserID == mUserSession.ID) > 0;
            return result;
        }

        public async Task<bool> IsExists(int ID)
        {
            var exists = await mDb.Set<Category>().AsNoTracking().CountAsync(at => at.ID == ID) > 0;
            return exists;
        }

    }
}
