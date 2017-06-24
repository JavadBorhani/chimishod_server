using Falcon.EFCommonContext;
using Falcon.Web.Common;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Public
{
    public abstract class JobBase : IJob
    {
        protected bool Done;
        protected virtual IDbContext mDb
        {
            get
            {
                if (mDb == null)
                {
                    BeginTransaction();
                }
                return mDb;
            }
            set
            {
                mDb = value;
            }
        }

        protected virtual IJobManager mJobManager
        {
            get { return WebContainerManager.Get<IJobManager>();}
        }

        public JobBase()
        {
        }
        public void BeginTransaction()
        {
            mDb = new CommonModelFirstDbContext(null);
            mDb.Database.Connection.Open();
            mDb.Database.BeginTransaction();
        }

        public abstract void StartJob();

        public void EndTransaction()
        {
            if(Done && mDb != null)
            {
                mDb.Database.CurrentTransaction.Commit();
            }
            else
            {
                mDb.Database.CurrentTransaction.Rollback();
            }
        }
    }
}