using Falcon.Web.Api.JobSystem.Public;
using Hangfire;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public class CalculateQuestPeopleNormal : JobBase
    {
        public override void ActivateMode()
        {
            mJobManager.AddOrUpdate(() => StartJob(), Cron.MinuteInterval(2));
        }

        public override string StartJob()
        {
            //fetch each item and recalculate per level 
            var value = mDb.UpdateCharacterRank();

            Done = true;
            EndTransaction();
            return "Message  : " + value;
        }

    }
}