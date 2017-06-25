using Falcon.Web.Api.JobSystem.Public;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public class CharacterRankUpdate : JobBase
    {
        public override void ActivateMode()
        {
            mJobManager.AddOrUpdate(() => StartJob(), Cron.MinuteInterval(2));
        }

        public override void StartJob()
        {
            var value = mDb.UpdateCharacterRank();

            if (value >= 0)
                Done = true;

            EndTransaction();
        }
    }
}