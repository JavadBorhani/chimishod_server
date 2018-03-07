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
            
            try
            {
                var value = mDb.UpdatePeopleNormalQuest();

                Done = true;
                EndTransaction();
                return "Message  : " + value;
            }
            catch
            {
                EndTransaction();
                return "Message : Exception occured in job system";
            }
        }

    }
}