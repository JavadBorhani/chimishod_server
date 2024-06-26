﻿using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Api.JobSystem.Public;
using Falcon.Web.Common;
using System.Collections.Generic;

namespace Falcon.Web.Api.JobSystem.Private.Jobs
{
    public class QuestionCounterNotification : JobBase
    {
        public override void ActivateMode()
        {
            //mJobManager.AddOrUpdate(() => StartJob(), Cron.HourInterval(3));
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
            // Algorithm 
            // foreach item of question notification configuration 
            // catch data from question table 
            // left join with table question notification
            // checkout if current item is in the range of configuration 
            // then add it to the list of items to send
            // first send notification then store items in table 
            // then continue the foreach loop 

            return 1;
        }


        private bool SaveNotifications(List<QuestionNotification> Questions)
        {
            mDb.Set<QuestionNotification>().AddRange(Questions);
            mDb.SaveChanges();
            return false;
        }

    }
}