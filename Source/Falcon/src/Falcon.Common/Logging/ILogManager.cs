using log4net;
using System;


namespace Falcon.Common.Logging
{
    public interface ILogManager
    {
        ILog GetLog(Type typeAssociatedWithRequesedLog);
    }
}
