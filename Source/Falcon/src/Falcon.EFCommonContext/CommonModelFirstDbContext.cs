using Falcon.EFCommonContext.DbModel;

namespace Falcon.EFCommonContext
{
    public class CommonModelFirstDbContext : DbEntity, IDbContext
    {
        private const string DatabaseConnectionName = "name=DbEntity";
        public CommonModelFirstDbContext(string NameOrConnectionString) 
            : base(DatabaseConnectionName)
        {

        }
    }
}
