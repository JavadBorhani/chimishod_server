using AutoMapper;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.InMemory.Public;
using Falcon.Web.Common;
using Falcon.Web.Models.Api.Level;
using Falcon.Web.Models.Api.Quest;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;

namespace Falcon.Web.Api.InMemory.Private
{
    public class QuestInMemory : IQuestInMemory
    {
        private ConcurrentDictionary<int, SQuest> mQuests = new ConcurrentDictionary<int, SQuest>();
        private ConcurrentDictionary<int, SLevel> mLevels = new ConcurrentDictionary<int, SLevel>();
        private ConcurrentDictionary<int, Tuple<SFinaleQuest, List<int>>> mBarretts = new ConcurrentDictionary<int, Tuple<SFinaleQuest, List<int>>>();

        private int mFinaleQuest;
        private int mLastLevel;
        private int mLastQuest;

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
            ReadBarrettsFromDatabase();
            ReadQuestsFromDatabase();
            ReadLevelsFromDatabase();
        }

        public void ReadBarrettsFromDatabase()
        {
            mBarretts.Clear();

            var barretts = mDB.Set<BarrettType>().AsNoTracking().ToArray();
            var sBarrets = mMapper.Map<List<SFinaleQuest>>(barretts);

            for(int i = 0; i < barretts.Length;++i)
            {
                mBarretts.TryAdd(barretts[i].ID, new Tuple<SFinaleQuest, List<int>>(sBarrets[i], new List<int>()));
            }

        }

        private void ReadQuestsFromDatabase()
        {
            var query = mDB.Set<Quest>()
                .AsNoTracking()
                .OrderBy(u => u.ParentID)
                .ToArray();

            mQuests.Clear();
            mLastQuest = -1;
            mFinaleQuest = -1;

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
                    BarretTypeID = query[i].BarrettType,
                    ParentID = query[i].ParentID,
                    Price = query[i].Price,
                    NumberOfQuestionsInQuest = query[i].NumberOfQuestionsInQuest,
                    ChildQuestNumbers = new List<int>(),
                };

                if (quest.QuestTypes == QuestTypes.Finale)
                    mFinaleQuest = quest.QuestNumber;

                //add quest list
                mQuests.TryAdd(query[i].QuestNumber, quest);

                if (query[i].ParentID != null)
                {
                    int parentID = query[i].ParentID ?? 0;


                    //add to quest list 
                    mQuests[parentID].ChildQuestNumbers.Add(query[i].QuestNumber);
                }

                var questNumber = query[i].QuestNumber;

                if (questNumber > mLastQuest)
                {
                    mLastQuest = questNumber;
                }

                AddBarrettType(quest);
            }
        }

        private void AddBarrettType(SQuest Quest)
        {
            var barrettID = Quest.BarretTypeID ?? -1 ;

            if (barrettID != -1)
            {
                Tuple<SFinaleQuest, List<int>> tuple; 
                mBarretts.TryGetValue(barrettID,out tuple);

                if (tuple != null)
                {
                    tuple.Item2.Add(Quest.QuestNumber);
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
            mLastLevel = -1;


            for(int i = 0; i < levels.Length;  ++i)
            {
                SLevel level = new SLevel
                {
                    LevelNumber = levels[i].LevelNumber,
                    CoinPrize = levels[i].CoinPrize,
                    ScoreCeil = levels[i].ScoreCeil
                };

                var levelNumber = levels[i].LevelNumber;

                if (levelNumber > mLastLevel)
                    mLastLevel = levelNumber;

                mLevels.TryAdd(levelNumber, level);

            }
        }

        public int GetLastLevel()
        {
            return mLastLevel;
        }

        public int GetLastQuest()
        {
            return mLastQuest;
        }

        public bool SetState(ConcurrentDictionary<int, SQuest> NewState)
        {
            throw new NotImplementedException();
        }

        public SQuest GetFinaleQuest()
        {
            return mQuests[mFinaleQuest];
        }

        public SFinaleQuest GetBarrettType(int BarrettType)
        {
            throw new NotImplementedException();
        }

        public HashSet<int> GetParentQuestNumbers(List<int> QuestNumbers)
        {
            HashSet<int> parentQuestNumbers = new HashSet<int>();

            for(int i = 0; i < QuestNumbers.Count; ++i)
            {
                var parentID = mQuests[QuestNumbers[i]].ParentID ?? -1;
                if(parentID != -1)
                {
                    parentQuestNumbers.Add(parentID);
                }
            }

            return parentQuestNumbers;
        }

        public List<int> GetAllBarretTypes()
        {
            return mBarretts.Keys.ToList();
        }

        public List<SQuest> GetAllQuestItems()
        {
            return mQuests.Values.ToList();
        }

        public ConcurrentDictionary<int, Tuple<SFinaleQuest, List<int>>> Barretts
        {
            get
            {
                return mBarretts;
            }
        }
    }
}