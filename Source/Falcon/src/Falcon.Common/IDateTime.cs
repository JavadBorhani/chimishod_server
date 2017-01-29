// BMS-Studio Copyright 2017-2018

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common
{
    public interface IDateTime
    {
        DateTime UtcNow { get; }
        DateTime Now { get; }
    }
}
