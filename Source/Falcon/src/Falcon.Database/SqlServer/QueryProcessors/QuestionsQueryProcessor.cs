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

        public async Task<Question[]> GetQuestionList(bool IsPublic, int HashtagID, int[] Excepts = null)
        {
            var query = mDb.Set<Question>()
                .AsNoTracking()
                .Where(q => q.IsPublic == true && q.HashTagID == HashtagID && !Excepts.Contains(q.ID))
                .ToArrayAsync();

            var data = await query;

            return data;    
        }
    }
}
