using Hangfire;
using Hangfire.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Public
{
    public class JobConfiguration
    {

        public void Configure()
        {
            RemoveRecurringJobs();

            var job = typeof(JobBase);

            var types = AppDomain.CurrentDomain.GetAssemblies()
                .Where(a => a.GetName().Name.StartsWith("Falcon"))
                .SelectMany(s => s.GetTypes())
                .Where(s => job.IsAssignableFrom(s) && !s.IsAbstract);

            foreach (var item in types)
            {
                var instance = (JobBase)Activator.CreateInstance(item);
                instance.ActivateMode();
            }
        }
        private void RemoveRecurringJobs()
        {
            using (var connection = JobStorage.Current.GetConnection())
            {
                foreach (var item in connection.GetRecurringJobs())
                {
                    RecurringJob.RemoveIfExists(item.Id);
                }
            }
        }
    }
}