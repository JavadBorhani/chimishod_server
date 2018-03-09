using Hangfire;
using Hangfire.Dashboard;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(Falcon.Web.Api.Startup))]

namespace Falcon.Web.Api
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {

            app.UseHangfireDashboard("/ServerJobs", new DashboardOptions
            {
                AuthorizationFilters = new [] {new BasicAuthAuthorizationFilter(new BasicAuthAuthorizationFilterOptions
                {
                    SslRedirect = false,
                    RequireSsl = false,
                    // Case sensitive login checking
                    LoginCaseSensitive = true,
                    // Users
                    Users = new[]
                    {
                        new BasicAuthAuthorizationUser
                        {
                            Login = "FlappAdmin",
                            PasswordClear = "@@@Visualbasic7"
                        },
                    }
                })}
            });

            app.UseHangfireServer();
        }
    }
}
