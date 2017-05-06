﻿using Falcon.Common;
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
    public class AppAdvertisementsQueryProcessor : IAppAdvertisementsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        public AppAdvertisementsQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDb = Database;
            mDateTime = DateTime;
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
    }
}
