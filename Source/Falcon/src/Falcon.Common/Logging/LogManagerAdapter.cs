// BMS-Studio Copyright 2017-2018

using System;
using log4net;

namespace Falcon.Common.Logging
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
