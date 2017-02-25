// Flapp Copyright 2017-2018

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common.Security
{
    public interface IWebUserSession : IUserSession
    {
        string ApiVersionInUse { get; }
        Uri RequestUri { get; }
        string HttpRequestMethod { get; }
    }
}
