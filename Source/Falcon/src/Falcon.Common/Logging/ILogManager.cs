using log4net;
using System;


namespace BM.Common.Logging
{
    public interface ILogManager
    {
        ILog GetLog(Type typeAssociatedWithRequesedLog);
    }
}
