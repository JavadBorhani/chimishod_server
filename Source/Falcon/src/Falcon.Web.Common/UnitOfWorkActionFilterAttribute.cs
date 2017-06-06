// Flapp Copyright 2017-2018

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace Falcon.Web.Common
{
    public class UnitOfWorkActionFilterAttribute : ActionFilterAttribute
    {
        public virtual IActionTransactionHelper ActionTransactionHelper
        {
            get { return WebContainerManager.Get<IActionTransactionHelper>(); }
        }
        public override bool AllowMultiple // To Prevent Calling this function twice in the same request 
        {
            get { return false; }
        }
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            ActionTransactionHelper.BeginTransaction();
        }
        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            ActionTransactionHelper.EndTransaction(actionExecutedContext);
            ActionTransactionHelper.CloseSession();
        }

    }
}
