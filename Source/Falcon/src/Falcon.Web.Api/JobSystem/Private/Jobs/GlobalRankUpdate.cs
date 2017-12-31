using Falcon.Web.Api.JobSystem.Public;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public sealed class GlobalRankUpdate : JobBase
    {

        public override void ActivateMode()
        {
            //mJobManager.AddOrUpdate(() => StartJob(), Cron.MinuteInterval(5));
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