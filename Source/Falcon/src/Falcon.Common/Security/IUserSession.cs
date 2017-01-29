// BMS-Studio Copyright 2017-2018

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Common.Security
{
    public interface IUserSession
    {
        string UUID { get; }
        string  FirstName { get; }
        string  LastName { get; }
        string  UserName { get; }
        bool IsInRle(string roleName);
    }
}
