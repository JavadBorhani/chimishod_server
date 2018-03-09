// Flapp Copyright 2017-2018

using System.Web.Http.Filters;

namespace Falcon.Web.Common
{
    public interface IActionTransactionHelper
    {
        void BeginTransaction();
        void EndTransaction(HttpActionExecutedContext filterContext);
        void CloseSession();
        //void CloseDatabaseConnection();
    }
}
