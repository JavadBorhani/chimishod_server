using Falcon.Common.Logging;
using Falcon.Web.Common;
using System.Web.Http;


namespace Falcon.Web.Api
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
        protected void Application_Error()
        {
            var exception = Server.GetLastError();
            if(exception != null)
            {
                var log = WebContainerManager.Get<ILogManager>().GetLog(typeof(WebApiApplication));
                log.Error("Unhandled exception.", exception); 
            }
        }
    }
}
