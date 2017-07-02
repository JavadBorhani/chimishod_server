using Falcon.Web.Api.JobSystem.Public;
using Hangfire;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public sealed class CharacterRankUpdate : JobBase
    {
        public override void ActivateMode()
        {
            mJobManager.AddOrUpdate(() => StartJob(), Cron.MinuteInterval(5));
        }

        public override string StartJob()
        {
            var value = mDb.UpdateCharacterRank();
            Done = true;

            EndTransaction();

            return "Message : " + value;
        }
    }
}