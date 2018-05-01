using Falcon.Common;
using Falcon.Common.Extentions;
using Falcon.Common.Logging;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
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

        public QuestsQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession , IUserQueryProcessor UserQuery , ILogManager LogManager)
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
            mUserQuery = UserQuery;
            mLogger = LogManager.GetLog(typeof(QuestsQueryProcessor));
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
                .OrderBy(q => q.Priority)
                .Select(q => q.QuestionID)
                .Join(mDb.Set<Question>(), QuestionID => QuestionID, Question => Question.ID, (QuestionID, Question) => Question)
                .Include(s => s.QuestionAction)
                .ToArrayAsync();

            return questions;
        }

        public async Task<QuestQuestion> GetQuestQuestionLimitedByCurrentUserQuest(int QuestionID)
        {
            var currentUserQuest = await mUserQuery.GetUserCurrentQuestNumber(); //TODO Optimize this 

            var item = await mDb.Set<QuestQuestion>()
                .AsNoTracking()
                .Where(qq => qq.QuestNumber == currentUserQuest && qq.QuestionID == QuestionID)
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

            var scores = mDb.Set<QuestPeopleScore>()
                .AsNoTracking()
                .Where(u => u.LevelNumber == LevelNumber && QuestNumbers.Contains(u.QuestNumber));

            var userScores = await mDb.Set<QuestScoreSnapshot>()
                .AsNoTracking()
                .Where(m => m.UserID == mUserSession.ID && m.UserLevelNumber == LevelNumber && QuestNumbers.Contains(m.QuestNumber))
                .Join(scores, m => m.QuestNumber, u => u.QuestNumber, (scoreSnapshot, peopleScore) => new SQuestDetail
                {
                    QuestNumber = scoreSnapshot.QuestNumber,
                    UserScore = scoreSnapshot.ScorePoint,
                    PeopleScore = peopleScore.MeanScorePoint,
                })
                .ToListAsync();


            return userScores;
        }

        public async Task<List<SQuestDetail>> GetLiveQuestDetailWithPeopleStatus(int LevelNumber, List<int> QuestNumbers)
        {
            var scores = mDb.Set<QuestPeopleScore>()
                .AsNoTracking()
                .Where(u => u.LevelNumber == LevelNumber && QuestNumbers.Contains(u.QuestNumber));

            var userScores = await mDb.Set<QuestScore>()
                .AsNoTracking()
                .Where(m => m.UserID == mUserSession.ID && QuestNumbers.Contains(m.QuestNumber))
                .Join(scores, m => m.QuestNumber, u => u.QuestNumber, (liveScore, peopleScore) => new SQuestDetail
                {
                    QuestNumber = liveScore.QuestNumber,
                    UserScore = liveScore.Score,
                    PeopleScore = peopleScore.MeanScorePoint,
                })
                .ToListAsync();

            return userScores;
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

            var splitter = item.Description.Lines(item.Separator);


            FinaleDescription[] description = new FinaleDescription[splitter.Length / 2];
            
            for(int i=  0; i < description.Length; ++i)
            {
                description[i] = new FinaleDescription
                {
                    Title = splitter[i].Trim(),
                    Description = splitter[i + 1].Trim()
                };
            }

            SFinaleQuest quest = new SFinaleQuest
            {
                ID = item.ID,
                Title = item.Name,
                Description = description
            };

            return quest;
        }
    }
}
