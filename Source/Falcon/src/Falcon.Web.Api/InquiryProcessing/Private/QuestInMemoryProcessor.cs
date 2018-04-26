using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Quest;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestInMemoryProcessor : IQuestInMemoryProcessor
    {
        private ConcurrentDictionary<int, SQuest> mQuests = new ConcurrentDictionary<int, SQuest>();
        private ConcurrentDictionary<int, SLevel> mLevels = new ConcurrentDictionary<int, SLevel>();
        private int lastLevel; 

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

        public SQuest GetQuestByQuestNumber(int ID)
        {
            CheckAvalibility();

            SQuest data;
            mQuests.TryGetValue(ID, out data);

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
            ReadQuestsFromDatabase();
            ReadLevelsFromDatabase();
        }
        private void ReadQuestsFromDatabase()
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
                    ParentID = query[i].ParentID,
                    Price = query[i].Price,
                    NumberOfQuestionsInQuest = query[i].NumberOfQuestionsInQuest,
                    ChildQuestNumbers = new List<int>(),
                };

                //add quest list
                mQuests.TryAdd(query[i].QuestNumber, quest);

                if (query[i].ParentID != null)
                {
                    int parentID = query[i].ParentID ?? 0;


                    //add to quest list 
                    mQuests[parentID].ChildQuestNumbers.Add(query[i].QuestNumber);
                }

            }
        }
        private void ReadLevelsFromDatabase()
        {
            var levels = mDB.Set<Level>()
                .AsNoTracking()
                .OrderBy(u => u.LevelNumber)
                .ToArray();


            mLevels.Clear();
            lastLevel = -1;


            for(int i = 0; i < levels.Length;  ++i)
            {
                SLevel level = new SLevel
                {
                    LevelNumber = levels[i].LevelNumber,
                    CoinPrize = levels[i].CoinPrize,
                    ScoreCeil = levels[i].ScoreCeil
                };

                var levelNumber = levels[i].LevelNumber;

                if (levelNumber > lastLevel)
                    lastLevel = levelNumber;

                mLevels.TryAdd(levelNumber, level);

            }
        }

        public int GetLastLevel()
        {
            return lastLevel;
        }

        public bool SetState(ConcurrentDictionary<int, SQuest> NewState)
        {
            throw new NotImplementedException();
        }

        public SQuest[] GetQuestList()
        {
            //
            throw new NotImplementedException();
        }
    }
}