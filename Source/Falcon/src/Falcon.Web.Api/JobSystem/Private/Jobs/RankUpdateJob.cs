using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Common;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public class RankUpdateJob : JobBase
    {
        
        public RankUpdateJob()
        {
            mJobManager.AddOrUpdate(() => StartJob() , Cron.Minutely());
        }

        public override void StartJob()
        {
            if(mDb.UpdateUserGlobalRank() == 0 )
            {
                Done = true;
            }

            EndTransaction();
        }
    }
}