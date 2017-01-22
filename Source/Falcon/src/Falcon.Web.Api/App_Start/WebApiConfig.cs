using Falcon.Web.Common;
using Falcon.Common.Logging;
using Falcon.Web.Common.ErrorHandling;

using System.Web.Http;
using System.Web.Http.ExceptionHandling;

using System.Web.Http.Tracing;

namespace Falcon.Web.Api
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {

            config.EnableSystemDiagnosticsTracing();

            // Web API configuration and services

            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/v1/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "UUIDRoute",
                routeTemplate: "api/v1/{controller}/{UUID}",
                defaults: new { id = RouteParameter.Optional }
            );

            //TODO : Comment out in debug mode for error tracing 
            config.Services.Replace(typeof(ITraceWriter), new SimpleTraceWriter(WebContainerManager.Get<ILogManager>()));
            config.Services.Add(typeof(IExceptionLogger), new SimpleExceptionLogger(WebContainerManager.Get<ILogManager>()));
            config.Services.Replace(typeof(IExceptionHandler), new GlobalExceptionHandler());
        }
    }
}
