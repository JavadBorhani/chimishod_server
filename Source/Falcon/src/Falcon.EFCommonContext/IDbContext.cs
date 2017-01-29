
using System.Data.Entity;

namespace Falcon.EFCommonContext
{
    public interface IDbContext
    {
        Database Database { get; }
        DbSet<TEntity> Set<TEntity>() where TEntity : class;
        int SaveChanges();
        void Dispose();
    }
}