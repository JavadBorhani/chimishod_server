using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    }
}
