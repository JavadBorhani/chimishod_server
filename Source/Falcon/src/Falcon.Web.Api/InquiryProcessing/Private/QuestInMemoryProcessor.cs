using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Quest;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestInMemoryProcessor : IQuestInMemoryProcessor
    {
        private Dictionary<int, SQuest> mQuests = new Dictionary<int, SQuest>();

        public virtual IDbContext mDB
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

        public Dictionary<int, SQuest> GetState()
        {
            if(mQuests.Count == 0 )
            {
                ReadStateFromDatabase();
            }
            return mQuests;
        }

        public void ReadStateFromDatabase()
        {

            var query = mDB.Set<Quest>()
                .AsNoTracking()
                .OrderBy(u => u.ParentID)
                .ToArray();

            mQuests.Clear();

            for (int i = 0; i < query.Length; ++i)
            {
                SQuest quest = new SQuest
                {
                    QuestNumber = query[i].QuestNumber,
                    QuestTypes = (QuestTypes)query[i].QuestTypes,
                    QuestTitle = query[i].QuestTitle,
                    QuestDescription = query[i].QuestDescription,
                    QuestWhiteIcon = query[i].QuestWhiteIcon,
                    QuestColoredIcon = query[i].QuestColoredIcon,
                    QuestOffIcon = query[i].QuestOffIcon,
                    MeanScore = query[i].Mean_Score,
                    ChildQuestNumbers = new List<int>(),
                };

                mQuests.Add(query[i].QuestNumber, quest);

                if (query[i].ParentID != null)
                {
                    int parentID = query[i].ParentID ?? 0;
                    mQuests[parentID].ChildQuestNumbers.Add(query[i].QuestNumber);
                }
            }
        }

        public bool SetState(Dictionary<int, SQuest> NewState)
        {
            throw new NotImplementedException();
        }
    }
}