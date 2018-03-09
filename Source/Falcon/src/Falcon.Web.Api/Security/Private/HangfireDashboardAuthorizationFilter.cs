using Hangfire.Annotations;
using Hangfire.Dashboard;

namespace Falcon.Web.Api.Security.Private
{
    public class HangfireDashboardAuthorizationFilter : IDashboardAuthorizationFilter
    {
        public bool Authorize([NotNull] DashboardContext context)
        {

            return true;
        }
    }
}