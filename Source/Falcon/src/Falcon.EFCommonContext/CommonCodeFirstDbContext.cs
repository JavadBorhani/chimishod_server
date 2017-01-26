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
    }
}