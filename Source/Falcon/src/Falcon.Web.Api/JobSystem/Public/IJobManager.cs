using Hangfire.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Public
{
    public interface IJobManager
    {

        void AddOrUpdate(Expression<Action> methodCall, Func<string> cronExpression, TimeZoneInfo timeZone = null, string queue = "default");
        string Schedule([InstantHandle][NotNull] Expression<Action> methodCall, DateTimeOffset enqueueAt);
        string Schedule([InstantHandle][NotNull] Expression<Action> methodCall, TimeSpan delay);
        string Enqueue([InstantHandle][NotNull] Expression<Action> methodCall);
        string Enqueue<T>([InstantHandle][NotNull] Expression<Action<T>> methodCall);
    }
}