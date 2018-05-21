using AutoMapper;
using Falcon.Common;
using Falcon.Common.Logging;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Barrett;
using Falcon.Web.Models.Api.Quest;
using log4net;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestsQueryProcessor : IQuestsQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;
        private readonly IUserQueryProcessor mUserQuery;
        private readonly ILog mLogger;
        private readonly IMapper mMapper;

        public QuestsQueryProcessor(IDbContext Database , 
            IDateTime DateTime , 
            IUserSession UserSession , 
            IUserQueryProcessor UserQuery , 
            ILogManager LogManager ,
            IMapper Mapper)
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
            mUserQuery = UserQuery;
            mLogger = LogManager.GetLog(typeof(QuestsQueryProcessor));
            mMapper = Mapper;   
        }

        public async Task<SQuest[]> GetAllQuests()
        {
            //TODO Getting List of All Quests With Child Data


            var query = await mDb.Set<Quest>()
                .AsNoTracking()
                .OrderBy(u => u.ParentID)
                .ToArrayAsync();

            Dictionary<int, SQuest> data = new Dictionary<int, SQuest>();

            for(int i = 0; i < query.Length; ++i )
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
                    ChildQuestNumbers = new List<int>(),
                };

                data.Add(query[i].QuestNumber, quest);

                if(query[i].ParentID != null)
                {
                    int parentID = query[i].ParentID ?? 0 ;
                    data[parentID].ChildQuestNumbers.Add(query[i].QuestNumber);
                }

            }

            var items = data.Select(m => m.Value).ToArray();

            return items;
        }

        public async Task<Quest> GetQuestByID(int ID)
        {
            var data = await mDb.Set<Quest>()
                .AsNoTracking()
                .SingleOrDefaultAsync(q => q.QuestNumber == ID);

            return data;
        }

        public async Task<Question[]> GetQuestQuestions(int QuestNumber)
        {
            var questions = await mDb.Set<QuestQuestion>()
                .AsNoTracking()
                .Where(q => q.QuestNumber == QuestNumber)
                .Join(mDb.Set<Question>(), QuestQuestion => QuestQuestion.QuestionID , Question => Question.ID, (QuestQuestion, Question) => new
                {
                    Priority = QuestQuestion.Priority,
                    Question = Question
                })
                .OrderBy( u => u.Priority)
                .Select( u => u.Question)
                .Include(s => s.QuestionAction)
                .ToArrayAsync();

            return questions;
        }

        public async Task<QuestQuestion> GetQuestQuestionLimitedByCurrentUserQuest(int QuestionID , int CurrentUserQuest)
        {
            //var currentUserQuest = await mUserQuery.GetUserCurrentQuestNumber(); //TODO Optimize this 

            var item = await mDb.Set<QuestQuestion>()
                .AsNoTracking()
                .Where(qq => qq.QuestNumber == CurrentUserQuest && qq.QuestionID == QuestionID)
                .SingleOrDefaultAsync();

            return item;
        }

        public async Task<List<QuestScoreSnapshot>> GetFriendQuestDetail(int UserID, int LevelNumber, List<int> QuestNumber)
        {

            var friendScores = await mDb.Set<QuestScoreSnapshot>()
                .AsNoTracking()
                .Where(m => m.UserID == UserID && m.UserLevelNumber == LevelNumber && QuestNumber.Contains(m.QuestNumber))
                .OrderBy( m => m.QuestNumber)
                .ToListAsync();


            return friendScores;
        }

        public async Task<QuestScore[]> GetUserQuestScoresByIds(List<int> Ids)
        {
            var items = await mDb.Set<QuestScore>()
                .AsNoTracking()
                .Where(s => s.UserID == mUserSession.ID && Ids.Contains(s.QuestNumber))
                .ToArrayAsync();

            return items;
        }

        public async Task<List<SQuestDetail>> GetQuestDetailWithPeopleStatus(int LevelNumber, List<int> QuestNumbers)
        {

            var userScores = mDb.Set<QuestScoreSnapshot>()
                .AsNoTracking()
                .Where(m => m.UserID == mUserSession.ID && m.UserLevelNumber == LevelNumber && QuestNumbers.Contains(m.QuestNumber));

            var scores = await mDb.Set<QuestPeopleScore>()
                .AsNoTracking()
                .Where(u => u.LevelNumber == LevelNumber && QuestNumbers.Contains(u.QuestNumber))
                .GroupJoin(userScores, m => m.QuestNumber, u => u.QuestNumber, (peopleScore, scoreSnapshot) => new 
                {   
                    PeopleScore = peopleScore,
                    ScoreSnapshot = scoreSnapshot
                })
                .SelectMany(temp => temp.ScoreSnapshot.DefaultIfEmpty() , (joinData , questScoreSnapshot) => new SQuestDetail
                {
                    QuestNumber = joinData.PeopleScore.QuestNumber,
                    UserScoreNullable = questScoreSnapshot.ScorePoint,
                    PeopleScore = joinData.PeopleScore.MeanScorePoint
                })
                .ToListAsync();
            
            return scores;
        }

        public async Task<List<SQuestDetail>> GetLiveQuestDetailWithPeopleStatus(int LevelNumber, List<int> QuestNumbers)
        {

            var userScores = mDb.Set<QuestScore>()
             .AsNoTracking()
             .Where(m => m.UserID == mUserSession.ID && QuestNumbers.Contains(m.QuestNumber));

            var scores = await mDb.Set<QuestPeopleScore>()
                .AsNoTracking()
                .Where(u => u.LevelNumber == LevelNumber && QuestNumbers.Contains(u.QuestNumber))
                .GroupJoin(userScores, m => m.QuestNumber, u => u.QuestNumber, (peopleScore, scoreSnapshot) => new
                {
                    PeopleScore = peopleScore,
                    ScoreSnapshot = scoreSnapshot
                })
                .SelectMany(temp => temp.ScoreSnapshot.DefaultIfEmpty(), (joinData, questScoreSnapshot) => new SQuestDetail
                {
                    QuestNumber = joinData.PeopleScore.QuestNumber,
                    UserScoreNullable = questScoreSnapshot.Score,
                    PeopleScore = joinData.PeopleScore.MeanScorePoint
                })
                .ToListAsync();

            return scores;

        }

        public async Task<bool> IsPurchased(int QuestNumber)
        {
            var purchsed = await mDb.Set<PurchasedQuest>()
                .AsNoTracking()
                .Where(u => u.UserID == mUserSession.ID && u.QuestNumber == QuestNumber)
                .AnyAsync();

            return purchsed;
        }

        public async Task<bool> Purchase(int questNumber)
        {
            var purchase = new PurchasedQuest
            {
                QuestNumber = questNumber,
                UserID = mUserSession.ID,
            };

            try
            {
                mDb.Set<PurchasedQuest>().Add(purchase);
                await mDb.SaveChangesAsync();
                return true;

            }catch(Exception e)
            {
                mLogger.Error($"asked for second purchase : , userID : {mUserSession.ID} error : {e.Message}" );
                return true;
            }
        }

        public async Task<Question> GetQuestQuestion(int QuestNumber, int QuestionID)
        {
            var question = await mDb.Set<QuestQuestion>()
                .AsNoTracking()
                .Where(u => u.QuestNumber == QuestNumber && u.QuestionID == QuestionID)
                .Select(s => s.Question)
                .SingleOrDefaultAsync();

            return question;
        }

        public async Task<SFinaleQuest> GetFinaleQuestDescription(int FinaleItemID)
        {

            var item = await mDb.Set<BarrettType>()
                .AsNoTracking()
                .Where(u => u.ID == FinaleItemID)
                .SingleOrDefaultAsync();

            var quest = mMapper.Map<SFinaleQuest>(item);

            return quest;
        }

        public async Task<Dictionary<Tuple<int, int>, SQuestScoreSnapshot>> GetUserQuestScoreSnapshots(List<int> QuestNumbers , List<int> ParentIDs)
        {
            var items = await mDb.Set<QuestScoreSnapshot>()
                .AsNoTracking()
                .Where(u => u.UserID == mUserSession.ID && QuestNumbers.Contains(u.QuestNumber) && QuestNumbers.Contains(u.UserLevelNumber))
                .Where(u => u.UserLevelNumber == u.QuestNumber || ParentIDs.Contains(u.QuestNumber))
                .Select( u => new SQuestScoreSnapshot
                {
                    UserID = u.UserID, 
                    QuestNumber = u.QuestNumber,
                    UserLevelNumber = u.UserLevelNumber,
                    ScorePoint = u.ScorePoint
                })
                .ToArrayAsync();

            var response = new Dictionary<Tuple<int, int>,SQuestScoreSnapshot>();
            
            for(int i = 0; i < items.Length; ++i)
            {
                response.Add(new Tuple<int, int>(items[i].UserLevelNumber, items[i].QuestNumber), items[i]);
            }

            return response;
        }

        public async Task<List<SQuestScoreSnapshot>> GetUserQuestScoreSnapshot(int QuestNumber , int ParentQuestNumber)
        {
            int[] quests = new int[2];

            quests[0] = QuestNumber;
            quests[1] = ParentQuestNumber;

            var items = await mDb.Set<QuestScoreSnapshot>()
                .AsNoTracking()
                .Where( u => u.UserID == mUserSession.ID && quests.Contains(u.QuestNumber) && quests.Contains(u.UserLevelNumber))
                .Select(u => new SQuestScoreSnapshot
                {
                    UserID = u.UserID,
                    QuestNumber = u.QuestNumber,
                    UserLevelNumber = u.UserLevelNumber,
                    ScorePoint = u.ScorePoint
                })
                .ToListAsync();


            return items;
        }

        public async Task<List<SBarrettUserScore>> RetrieveUserBarrettSnapshot(int UserID , List<int> BarrettTypes)
        {
            var items = await mDb.Set<BarrettUserScore>()
                .AsNoTracking()
                .Where(u => u.UserID == UserID && BarrettTypes.Contains(u.BarrettID))
                .Select(u => new SBarrettUserScore
                {
                    BarrettID = u.BarrettID,
                    UserID = u.UserID,
                    Score = u.Score
                })
                .ToListAsync();

            return items;
        }

        public async Task<bool> SaveUserBarrettScores(List<SBarrettUserScore> Items)
        {
            var userScores = new BarrettUserScore[Items.Count];

            for(int i = 0; i < Items.Count;++i)
            {
                userScores[i] = new BarrettUserScore
                {
                    BarrettID = Items[i].BarrettID,
                    UserID = Items[i].UserID,
                    Score = Items[i].Score
                };
            }

            if (userScores.Count() > 0)
            {
                mDb.Set<BarrettUserScore>().AddRange(userScores);
                await mDb.SaveChangesAsync();
                return true;
            }

            return false;   
        }
    }
}
