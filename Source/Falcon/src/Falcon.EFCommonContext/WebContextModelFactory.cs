using System.Threading;
using System.Web;

namespace Falcon.EFCommonContext
{
    public class WebContextModelFactory : IWebContextFactory
    {
        public const string DbContextCacheKey = "DbContext";
        private readonly string mNameOrConnectionString;
        public static int ConnectionCount = 0;

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
                IncrementConnectionCount();
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
        public void IncrementConnectionCount()
        {
            Interlocked.Increment(ref ConnectionCount); //TODO : Remove this;
        }

        public void DecrementConnectionCount()
        {
            Interlocked.Decrement(ref ConnectionCount); //TODO : Remove this;
        }

        public static void Increment()
        {
            Interlocked.Increment(ref ConnectionCount); //TODO : Remove this;
        }

        public static void Decrement()
        {
            Interlocked.Decrement(ref ConnectionCount); //TODO : Remove this;
        }
    }
}