using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Common;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public sealed class GlobalRankUpdate : JobBase
    {

        public override void ActivateMode()
        {
            mJobManager.AddOrUpdate(() => StartJob(), Cron.MinuteInterval(5));
        }

        public override string StartJob()
        {
            int value = mDb.UpdateUserGlobalRank();
            Done = true;

            EndTransaction();

            return "Message : " + value;
        }   
    }
}