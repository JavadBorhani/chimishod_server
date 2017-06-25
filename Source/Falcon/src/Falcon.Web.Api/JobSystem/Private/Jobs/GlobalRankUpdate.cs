﻿using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Common;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public class GlobalRankUpdate : JobBase
    {

        public override void ActivateMode()
        {
            mJobManager.AddOrUpdate(() => StartJob(), Cron.MinuteInterval(5));
        }

        public override void StartJob()
        {
            int value = mDb.UpdateUserGlobalRank();
            Done = true;

            EndTransaction();
        }   
    }
}