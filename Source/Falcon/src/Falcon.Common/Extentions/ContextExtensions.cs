// Flapp Copyright 2017-2018

using System;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;

namespace Falcon.Common.Extentions
{
    public static class ContextExtensions
    {
        
        public static T AddIfNotExists<T>(this DbSet<T> dbSet, T entity, Expression<Func<T, bool>> predicate = null) where T : class, new()
        {
            var exists = predicate != null ? dbSet.Any(predicate) : dbSet.Any();
            return !exists ? dbSet.Add(entity) : null;
        }
    }
}
