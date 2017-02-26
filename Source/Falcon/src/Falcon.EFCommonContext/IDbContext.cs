
using System.Data.Entity;
using System.Threading;
using System.Threading.Tasks;

namespace Falcon.EFCommonContext
{
    public interface IDbContext
    {
        Database Database { get; }
        DbSet<TEntity> Set<TEntity>() where TEntity : class;
        int SaveChanges();
        void Dispose();
        Task<int> SaveChangesAsync();
        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
    }
}