using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace Falcon.EFCommonContext
{
    internal class CommonCodeFirstDbContext : DbContext, IDbContext
    {
        internal CommonCodeFirstDbContext(string nameOrConnectionString, DbCompiledModel model)
            : base(nameOrConnectionString, model)
        {
        }

        public int UpdateCharacterRank()
        {
            return this.UpdateCharacterRank();
        }

        public int UpdatePeopleNormalQuest()
        {
            return this.UpdatePeopleNormalQuest();
        }

        public int UpdateUserGlobalRank()
        {
            return this.UpdateUserGlobalRank();
        }
    }
}