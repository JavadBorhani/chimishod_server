using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http.Filters;

namespace Falcon.Web.Common
{
    public class ActionTransactionHelper : IActionTransactionHelper
    {
        public void BeginTransaction()
        {
            throw new NotImplementedException();
        }

        public void CloseSession()
        {
            throw new NotImplementedException();
        }

        public void EndTransaction(HttpActionExecutedContext filterContext)
        {
            throw new NotImplementedException();
        }
    }
}
