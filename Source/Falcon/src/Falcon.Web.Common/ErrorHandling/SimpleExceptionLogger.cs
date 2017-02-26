// Flapp Copyright 2017-2018

using Falcon.Common.Logging;
using log4net;
using System.Web.Http.ExceptionHandling;

namespace Falcon.Web.Common.ErrorHandling
{
    public class SimpleExceptionLogger : ExceptionLogger
    {
        private readonly ILog mLog;
        
        public SimpleExceptionLogger(ILogManager logManager)
        {
            mLog = logManager.GetLog(typeof(SimpleExceptionLogger));
        }

        public override void Log(ExceptionLoggerContext context)
        {
            mLog.Error("Unhandled exception", context.Exception); 
        }
    }
}
