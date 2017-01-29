// BMS-Studio Copyright 2017-2018

using log4net;
using System;


namespace Falcon.Common.Logging
{
    public interface ILogManager
    {
        ILog GetLog(Type typeAssociatedWithRequesedLog);
    }
}
