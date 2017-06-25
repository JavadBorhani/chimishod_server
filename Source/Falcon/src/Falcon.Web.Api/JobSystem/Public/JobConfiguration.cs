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
    }
}