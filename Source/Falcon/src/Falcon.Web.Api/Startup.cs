using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Hangfire;
using Falcon.Web.Api.Security.Private;

[assembly: OwinStartup(typeof(Falcon.Web.Api.Startup))]

namespace Falcon.Web.Api
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseHangfireDashboard("/ServerJobs", new DashboardOptions
            {
                Authorization = new[] { new HangfireDashboardAuthorizationFilter() }
            });
            app.UseHangfireServer();
        }
    }
}
