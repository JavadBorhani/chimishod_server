using Falcon.Common.Logging;
using Falcon.Web.Common;
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

            //config.EnableSystemDiagnosticsTracing();

            // Web API configuration and services

            config.MapHttpAttributeRoutes();

            //config.Routes.MapHttpRoute(
            //    name: "DefaultApi",
            //    routeTemplate: "api/v1/{controller}/{id}",
            //    defaults: new { id = RouteParameter.Optional }
            //);

            //config.Routes.MapHttpRoute(
            //    name: "UUIDRoute",
            //    routeTemplate: "api/v1/{controller}/{UUID}",
            //    defaults: new { id = RouteParameter.Optional }
            //);

            //Summary : A Key to see exactly what's going on behind the scene step by step
            config.Services.Replace(typeof(ITraceWriter), new SimpleTraceWriter(WebContainerManager.Get<ILogManager>()));


            //TODO : Adding Namespace routing to controller , Also remember to remove the above route codes, no more default controller based routing

            //var constraintResolver = new DefaultInlineConstraintResolver();
            //constraintResolver.ConstraintMap.Add("apiVersionConstraint", typeof(ApiVersionConstraint));
            //config.MapHttpAttributeRoutes(constraintResolver);
            //config.Services.Replace(typeof(IHttpControllerSelector), new NamespaceHttpControllerSelector(config)); 

            config.Services.Replace(typeof(IExceptionHandler), new GlobalExceptionHandler());
            config.Services.Add(typeof(IExceptionLogger), new SimpleExceptionLogger(WebContainerManager.Get<ILogManager>()));

            

        }
    }
}
