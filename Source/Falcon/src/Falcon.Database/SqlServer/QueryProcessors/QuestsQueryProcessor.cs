using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Quest;
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
        public QuestsQueryProcessor(IDbContext Database , IDateTime DateTime)
        {
            mDb = Database;
            mDateTime = DateTime;
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
                    MeanScore = query[i].Mean_Score,
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
            var data = await mDb.Set<Quest>().AsNoTracking().SingleOrDefaultAsync(q => q.QuestNumber == ID);
            return data;
        }

        public async Task<Question[]> GetQuestQuestions(int QuestNumber)
        {
            var questions = await mDb.Set<QuestQuestion>()
                .AsNoTracking()
                .Where(q => q.QuestNumber == QuestNumber)
                .Select(q => q.QuestionID)
                .Join(mDb.Set<Question>(), QuestionID => QuestionID, Question => Question.ID, (QuestionID, Question) => Question)
                .ToArrayAsync();

            return questions;
        }
    }
}
