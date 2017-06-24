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

        protected IDbContext _mDb;
        protected virtual IDbContext mDb
        {
            get
            {
                if (_mDb == null)
                {
                    _mDb = new CommonModelFirstDbContext(null);
                    _mDb.Database.Connection.Open();
                    _mDb.Database.BeginTransaction();
                }
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

        public abstract void Activate();

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