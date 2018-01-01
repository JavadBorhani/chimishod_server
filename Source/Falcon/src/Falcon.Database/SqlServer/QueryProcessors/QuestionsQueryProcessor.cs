using Falcon.Common;
using Falcon.Common.Security;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestionsQueryProcessor /*: IQuestionsQueryProcessor*/
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

        //public async Task<bool> IsDeletable(int QuestionID)
        //{
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
        //}
    }
}
