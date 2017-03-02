using Falcon.EFCommonContext;
using System.Data.Entity.ModelConfiguration;

namespace Falcon.Database.SqlServer.Mapping
{
    public abstract class VersionedClassMap<T> : EntityTypeConfiguration<T> where T : class, IVersionedEntity
    {
        protected VersionedClassMap()
        {
            Property(x => x.Version)
                .HasColumnName("ts")
                .IsRowVersion();
        }
    }
}
