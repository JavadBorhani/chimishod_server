using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Notification;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;

namespace Falcon.Web.Api.InMemory.Private
{
    public class QuestionNotifyConfigInMemory : IQuestionNotifyConfigInMemory
    {
        private ConcurrentDictionary<int, SQuestionNotificationConfiguration> mQuestionNotificationConfiguration = 
            new ConcurrentDictionary<int, SQuestionNotificationConfiguration>();

        private int mLastItemID;

        public virtual IDbContext mDb
        {
            get
            {
                return WebContainerManager.Get<IDbContext>();
            }
        }

        public virtual IMapper mMapper
        {
            get
            {
                return WebContainerManager.Get<IMapper>();
            }
        }

        public ConcurrentDictionary<int, SQuestionNotificationConfiguration> GetState()
        {
            return mQuestionNotificationConfiguration;
        }

        public void ReadStateFromDatabase()
        {
            mQuestionNotificationConfiguration.Clear();

            var items = mDb.Set<QuestionNotificationConfiguration>()
                .AsNoTracking()
                .OrderBy(u => u.QuestionAnswerCountMaxRange)
                .ToList();

            int longestNumber = 0;

            for (int i = 0; i < items.Count; ++i)
            {
                var sItem = mMapper.Map<SQuestionNotificationConfiguration>(items[i]);

                if (sItem.QuestionAnswerCountMaxRange > longestNumber)
                {
                    longestNumber = sItem.QuestionAnswerCountMaxRange;
                    mLastItemID = sItem.ID;
                }

                mQuestionNotificationConfiguration.TryAdd(items[i].ID, sItem);
            }

        }

        public bool SetState(ConcurrentDictionary<int, SQuestionNotificationConfiguration> NewState)
        {
            mQuestionNotificationConfiguration = NewState;
            return true;
        }

        public List<SQuestionNotificationConfiguration> GetAllItems()
        {
            var items = mQuestionNotificationConfiguration.Values.ToList();
            return items;
        }

        public SQuestionNotificationConfiguration GetLastItem()
        {
            return mQuestionNotificationConfiguration[mLastItemID];
        }
    }
}