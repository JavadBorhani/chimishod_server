// BMS-Studio Copyright 2017-2018
using Falcon.EFCommonContext;
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
        private readonly IWebContextFactory mContextFactory;

        public ActionTransactionHelper(IWebContextFactory ContextFactory)
        {
            mContextFactory = ContextFactory;

        }

        public bool TransactionHandled
        {
            get;
            private set;
        }
        public bool SessionClosed
        {
            get;
            private set;
        }

        public void BeginTransaction()
        {
            if (!mContextFactory.ContextExists)
                return;

            var context = mContextFactory.GetCurrentContext();
            if(context != null)
            {
                context.Database.BeginTransaction();
            }
        }

        public void EndTransaction(HttpActionExecutedContext filterContext)
        {
            if (!mContextFactory.ContextExists)
                return;

            var context = mContextFactory.GetCurrentContext();

            if (context == null)
                return;

            if (context.Database.CurrentTransaction == null)
                return;

            if(filterContext.Exception == null)
            {
                context.SaveChanges();
                context.Database.CurrentTransaction.Commit();
            }
            else
            {
                context.Database.CurrentTransaction.Rollback();
            }
            TransactionHandled = true;
        }

        public void CloseSession()
        {
            if (!mContextFactory.ContextExists)
                return;

            var context = mContextFactory.GetCurrentContext();

            if (context == null)
                return;
            context.Database.Connection.Close();
            context.Dispose();
            mContextFactory.Reset();
            SessionClosed = true;
        }
    }
}
