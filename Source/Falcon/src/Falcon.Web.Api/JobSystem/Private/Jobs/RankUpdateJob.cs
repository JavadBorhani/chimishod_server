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
        }

        public override void StartJob()
        {
            int value = mDb.UpdateUserGlobalRank();
            if (value >= 0 )
            {
                Done = true;
            }
            EndTransaction();
        }

        public override void ActivateMode()
        {
            mJobManager.AddOrUpdate(() => StartJob(), Cron.MinuteInterval(2));
        }
    }
}