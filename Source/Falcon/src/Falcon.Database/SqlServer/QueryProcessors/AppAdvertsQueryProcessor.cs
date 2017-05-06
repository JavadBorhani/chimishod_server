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
    public class AppAdvertsQueryProcessor : IAppAdvertsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;

        public AppAdvertsQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
        }
        public async Task<List<AppAdvertisement>> GetUnexpiredList()
        {
            var now = mDateTime.Now;
            var result = await mDb.Set<AppAdvertisement>()
                .AsNoTracking()
                .Where(m => m.StartTime <= now && m.ExpireTime >= now)
                .OrderBy(m => m.Priority)
                .ToListAsync();

            return result;  
        }

        public async Task<bool> IsExists(int ID)
        {
            var count = await mDb.Set<AppAdvertisement>().AsNoTracking().CountAsync(m => m.ID == ID) > 0;
            return count;
        }

        public async Task<bool> AddPresentedAdvert(int ID)
        {
            mDb.Set<PresentedAdvert>().Add(new PresentedAdvert
            {
              UserID = mUserSession.ID,
              AdvertID = ID , 
              InsertDate = mDateTime.Now
            });

            await mDb.SaveChangesAsync();
            return true ;   
        }
    }
}
