using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.Security.Public
{
    public interface IBasicPrincipalSecurityService
    {
        bool SetPrincipal(string UUID);
    }
}
