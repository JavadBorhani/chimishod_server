using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{

    public class QuestionsQueryProcessor : IQuestionsQueryProcessor
    {
        private IDbContext mDb;
        private IUserSession mUserSession;
        private IDateTime mDateTime;

        public QuestionsQueryProcessor(IDbContext DBContext , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = DBContext;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }

        public async Task<bool> LogicallyRemoveByCreator(int QuestionID)
        {
            var item = await mDb.Set<Question>().FindAsync(QuestionID);
            if (item != null)
            {
                item.RemovedByCreator = true;
                await mDb.SaveChangesAsync();

                return true;
            }

            return false;
        }

        public async Task<bool> IsDeletable(int QuestionID)
        {
            //    var item = await mDb.Set<Manufacture>().AsNoTracking()
            //        .Where(u => u.UserID == mUserSession.ID)
            //        .Include(c => c.Question)
            //        .Select(u => u.Question)
            //        .Where(u => u.ID == QuestionID && u.RemovedByCreator == false)
            //        .SingleOrDefaultAsync();

            //    if(item != null)
            //    {
            //        return true;
            //    }
            //    return false;  
            return false;
        }

        public async Task<Question[]> GetQuestionList()
        {
            throw new NotImplementedException();
        }

        public async Task<Question[]> GetQuestionList(bool IsPublic, int HashtagID, int Amount ,OrderBy OrderBy = OrderBy.None, int[] Excepts = null)
        {
            IQueryable<Question> query = null;

            switch(OrderBy)
            {
                case OrderBy.CountDateTimeAscending:

                    query = mDb.Set<Question>()
                   .AsNoTracking()
                   .Include(q => q.QuestionAction)
                   .Include(q => q.User)
                   .Where(q => q.IsPublic == true && q.HashTagID == HashtagID && !Excepts.Contains(q.ID))
                   .OrderBy(q => q.CreatedDate)
                   .ThenBy(q => q.AnswerCount)
                   .Take(Amount);

                    break;
                case OrderBy.CountDateTimeWeight:
                    break;  
            }


            var data = await query?.ToArrayAsync();
            return data;    
        }

        public async Task<int> GetQuestionReportCount(int QuestionID)
        {
            var reportCount = await mDb.Set<Question>()
                .AsNoTracking()
                .Where(q => q.ID == QuestionID)
                .Select(q => q.ReportCount)
                .SingleOrDefaultAsync();

            return reportCount;
        }

        public async Task<bool> BanQuestion(int QuestionID)
        {
            var question = await mDb.Set<Question>().FindAsync(QuestionID);

            if(question != null)
            {
                question.Banned = true;

                await mDb.SaveChangesAsync();

                return true;
            }

            return false;
        }
    }
}
