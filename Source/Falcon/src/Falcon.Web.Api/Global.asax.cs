using Falcon.Common.Logging;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.Security.Private;
using Falcon.Web.Api.Security.Public;
using Falcon.Web.Common;
using Microsoft.AspNet.WebApi.Extensions.Compression.Server;
using System.Net.Http.Extensions.Compression.Core.Compressors;
using System.Web.Http;


namespace Falcon.Web.Api
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);

            RegisterHandlers();
            RegisterJobs();
            InitializeSystems();
        }

        private void RegisterHandlers()
        {
            var logManager = WebContainerManager.Get<ILogManager>();
            GlobalConfiguration.Configuration.MessageHandlers.Add(new BasicAuthenticationMessageHandler
                (logManager, WebContainerManager.Get<IBasicPrincipalSecurityService>()));

            //TODO: Add Token builder here 

            //Adding Compressing System
            GlobalConfiguration.Configuration.MessageHandlers.Insert(0, new ServerCompressionHandler
                (new GZipCompressor(), new DeflateCompressor()));

            
        }
        
        private void InitializeSystems()
        {
            WebContainerManager.Get<IServerInquiryProcessor>().ReadConfigurationFilesFromServer();
        }
        private void RegisterJobs()
        {
            //new JobConfiguration().RemoveRecurringJobs();
            new JobConfiguration().Configure();
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
