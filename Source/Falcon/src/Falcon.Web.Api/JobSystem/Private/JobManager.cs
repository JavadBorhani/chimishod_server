using Falcon.Web.Api.JobSystem.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Hangfire.Annotations;
using System.Linq.Expressions;
using Hangfire;

namespace Falcon.Web.Api.JobSystem.Private
{
    public class JobManager : IJobManager
    {
        public void AddOrUpdate(Expression<Action> methodCall, Func<string> cronExpression, TimeZoneInfo timeZone = null, string queue = "default")
        {
            RecurringJob.AddOrUpdate(methodCall, cronExpression, timeZone, queue);
        }

        public string Enqueue([InstantHandle, NotNull] Expression<Action> methodCall)
        {
            return BackgroundJob.Enqueue(methodCall);
        }

        public string Enqueue<T>([InstantHandle, NotNull] Expression<Action<T>> methodCall)
        {
            return BackgroundJob.Enqueue(methodCall);
        }

        public string Schedule([InstantHandle, NotNull] Expression<Action> methodCall, TimeSpan delay)
        {
            return BackgroundJob.Schedule(methodCall, delay);
        }

        public string Schedule([InstantHandle, NotNull] Expression<Action> methodCall, DateTimeOffset enqueueAt)
        {
            return BackgroundJob.Schedule(methodCall, enqueueAt);
        }
    }
}