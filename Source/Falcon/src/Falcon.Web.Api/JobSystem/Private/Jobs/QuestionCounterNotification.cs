using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Common;
using Hangfire;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public class QuestionCounterNotification : JobBase
    {
        public override void ActivateMode()
        {
            mJobManager.AddOrUpdate(() => StartJob(), Cron.HourInterval(3));
        }

        public override string StartJob()
        {

            try
            {
                var value = CalculateSystem();

                Done = true;
                EndTransaction();
                return "Message  : " + value;
            }
            catch
            {
                EndTransaction();
                throw new System.Exception("Job hasn't done in the system");
            }

        }

        protected IQuestionNotifyConfigInMemory mQuestionNotificationConfiguration
        {
            get
            {
                return WebContainerManager.Get<IQuestionNotifyConfigInMemory>();
            }
        }


        private int CalculateSystem()
        {
            
            return 1; 
        }


    }
}