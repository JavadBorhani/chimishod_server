﻿using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Data.Entity;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class LevelQueryProcessor : ILevelQueryProcessor
    {
        private readonly IDbContext mDb;
        public LevelQueryProcessor(IDbContext Database)
        {
            mDb = Database;
        }

        public async Task<Level[]> GetAll()
        {
            var data = await mDb.Set<Level>().AsNoTracking().ToArrayAsync();
            return data;    
        }
    }
}