using Hangfire.Dashboard;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Hangfire.Annotations;
using Microsoft.Owin;

namespace Falcon.Web.Api.Security.Private
{
    public class HangfireDashboardAuthorizationFilter : IDashboardAuthorizationFilter
    {
        public bool Authorize([NotNull] DashboardContext context)
        {
            //TODO : Remember to Add Hangfire Authorization 
            // https://github.com/HangfireIO/Hangfire.Dashboard.Authorization

            return true;
            //var owin = new OwinContext(context.GetOwinEnvironment());
            //return owin.Authentication.User.Identity.IsAuthenticated;
        }
    }
}