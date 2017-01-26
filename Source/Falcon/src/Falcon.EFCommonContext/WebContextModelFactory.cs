using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Reflection;
using System.Web;

namespace Falcon.EFCommonContext
{
    public class WebContextModelFactory : IWebContextFactory
    {
        public const string DbContextCacheKey = "DbContext";
        private readonly string mNameOrConnectionString;

        private WebContextModelFactory(string NameOrConnectionString)
        {
            mNameOrConnectionString = NameOrConnectionString;
        }

        public bool ContextExists
        {
            get
            {
                return HttpContext.Current.Items.Contains(DbContextCacheKey);
            }
        }

        public void Reset()
        {
            if (!ContextExists)
                return;

            var context = (IDbContext) HttpContext.Current.Items[DbContextCacheKey];
            context.Dispose();

            HttpContext.Current.Items.Remove(DbContextCacheKey);
        }

        public IDbContext GetNewOrCurrentContext()
        {
            if (!ContextExists)
            {
                var context = new CommonModelFirstDbContext(mNameOrConnectionString);
                context.Database.Connection.Open();
                HttpContext.Current.Items[DbContextCacheKey] = context;
            }

            return (IDbContext) HttpContext.Current.Items[DbContextCacheKey];
        }

        public IDbContext GetCurrentContext()
        {
            if (!ContextExists)
                return null;

            return (IDbContext) HttpContext.Current.Items[DbContextCacheKey];
        }

        public static WebContextModelFactory BuildSqlServer2012Factory(string NameOrConnectionString)
        {
            return new WebContextModelFactory(NameOrConnectionString);
        }
    }
}