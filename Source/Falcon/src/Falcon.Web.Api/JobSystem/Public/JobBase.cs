using Falcon.EFCommonContext;
using Falcon.Web.Common;
using Hangfire;
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

        protected IDbContext _mDb;
        protected IDbContext mDb
        {
            get
            {
                if (_mDb != null)
                    return _mDb;

                BeginTransaction();
                return _mDb;
            }
            set
            {
                _mDb = value;
            }
        }

        protected static IJobManager mJobManager
        {
            get { return WebContainerManager.Get<IJobManager>();}
        }

        public JobBase()
        {

        }

        public abstract void StartJob();

        public abstract void ActivateMode();

        public void EndTransaction()
        {

            if(mDb != null)
            {
                if(Done)
                {
                    mDb.Database.CurrentTransaction.Commit();
                }
                else
                {
                    mDb.Database.CurrentTransaction.Rollback();
                }
                mDb.Database.Connection.Close();
                mDb.Dispose();
            }

        }

        public void BeginTransaction()
        {
            mDb = new CommonModelFirstDbContext(null);
            mDb.Database.Connection.Open();
            mDb.Database.BeginTransaction();
        }
    }
}