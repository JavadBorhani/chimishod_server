using System;
using log4net;

namespace BM.Common.Logging
{
    public class LogManagerAdapter : ILogManager
    {
        public ILog GetLog(Type typeAssociatedWithRequesedLog)
        {
            var log = LogManager.GetLogger(typeAssociatedWithRequesedLog);
            return log;
        }
    }
}
