﻿using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Reflection;
using System.Threading;
using System.Web;

namespace Falcon.EFCommonContext
{
    public class WebContextFactory : IWebContextFactory
    {
        public const string DbContextCacheKey = "DbContext";
        private readonly DbCompiledModel mCompiledModel;
        private readonly string mNameOrConnectionString;
        public static int ConnectionCount = 0;

        private WebContextFactory(string nameOrConnectionString, DbCompiledModel compiledModel)
        {
            mNameOrConnectionString = nameOrConnectionString;
            mCompiledModel = compiledModel;
        }

        private WebContextFactory(string NameOrConnectionString)
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
                var context = new CommonCodeFirstDbContext(mNameOrConnectionString, mCompiledModel);
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

        public static WebContextFactory BuildFactory(string nameOrConnectionString, Assembly mappingAssembly, string providerName, string providerVersionHint)
        {
            var modelBuilder = new DbModelBuilder();
            modelBuilder.Configurations.AddFromAssembly(mappingAssembly);

            var providerInfo = new DbProviderInfo(providerName, providerVersionHint);
            var model = modelBuilder.Build(providerInfo);
            var compiledModel = model.Compile();

            return new WebContextFactory(nameOrConnectionString, compiledModel);
        }
        public static WebContextFactory BuildSqlServer2012Factory(string NameOrConnectionString)
        {
            return new WebContextFactory(NameOrConnectionString);
        }

        public void IncrementConnectionCount()
        {
            Interlocked.Increment(ref ConnectionCount);
        }

        public void DecrementConnectionCount()
        {
            Interlocked.Decrement(ref ConnectionCount);
        }
    }
}