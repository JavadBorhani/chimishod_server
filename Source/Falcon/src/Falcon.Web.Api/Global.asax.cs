﻿using Falcon.Common.Logging;
using Falcon.Web.Api.JobSystem.Private.Jobs;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Api.Security.Private;
using Falcon.Web.Api.Security.Public;
using Falcon.Web.Common;
using System;
using System.Linq;
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
        }

        private void RegisterHandlers()
        {
            var logManager = WebContainerManager.Get<ILogManager>();
            GlobalConfiguration.Configuration.MessageHandlers.Add(new BasicAuthenticationMessageHandler
                (logManager, WebContainerManager.Get<IBasicPrincipalSecurityService>()));

            //TODO: Add Token builder here 

            
        }
        private void RegisterJobs()
        {
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
