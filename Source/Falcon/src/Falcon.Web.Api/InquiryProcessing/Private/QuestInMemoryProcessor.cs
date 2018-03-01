using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Quest;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestInMemoryProcessor : IQuestInMemoryProcessor
    {
        private ConcurrentDictionary<int, SQuest> mQuests = new ConcurrentDictionary<int, SQuest>();
        private ConcurrentDictionary<int, SQuest> mLevelQuests = new ConcurrentDictionary<int, SQuest>();

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

        public SQuest GetQuestByID(int ID)
        {
            CheckAvalibility();

            SQuest data;
            mQuests.TryGetValue(ID, out data);

            return data;    
        }

        public SQuest GetQuestByLevelNumber(int LevelNumber)
        {
            CheckAvalibility();

            SQuest data;
            mLevelQuests.TryGetValue(LevelNumber ,out data);
            return data;
        }

        public ConcurrentDictionary<int, SQuest> GetState()
        {
            CheckAvalibility();
            return mQuests;
        }

        private void CheckAvalibility()
        {
            if (mQuests.Count == 0)
            {
                ReadStateFromDatabase();
            }
        }

        public void ReadStateFromDatabase()
        {

            var query = mDB.Set<Quest>()
                .AsNoTracking()
                .Include(u => u.Levels)
                .OrderBy(u => u.ParentID)
                .ToArray();

            mQuests.Clear();
            mLevelQuests.Clear();            

            for (int i = 0; i < query.Length; ++i)
            {
                var level = query[i].Levels.FirstOrDefault();

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
                    ParentID = query[i].ParentID,
                    ChildQuestNumbers = new List<int>(),
                    LevelNumber = level.LevelNumber,
                };

                //add quest list
                mQuests.TryAdd(query[i].QuestNumber, quest);

                //add level with quest list
                mLevelQuests.TryAdd(level.LevelNumber, quest);

                if (query[i].ParentID != null)
                {
                    int parentID = query[i].ParentID ?? 0;


                    //add to quest list 
                    mQuests[parentID].ChildQuestNumbers.Add(query[i].QuestNumber);

                    //add to level quest list -> doesn't need to be added since they reference the same memory 
                }

            }
        }

        public bool SetState(ConcurrentDictionary<int, SQuest> NewState)
        {
            throw new NotImplementedException();
        }

        
    }
}