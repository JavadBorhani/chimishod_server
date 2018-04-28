using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using System;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestQuestionsQueryProcessor : IQuestQuestionsQueryProcessor
    {
        private readonly IUserSession mUserSession;
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        public QuestQuestionsQueryProcessor(IDbContext Database , IUserSession UserSession , IDateTime DateTime)
        {
            mDb = Database;
            mUserSession = UserSession;
            mDateTime = DateTime;
        }

        public async Task<bool> SaveQuestQuestionAnswer()
        {
            throw new NotImplementedException();
        }
    }
}
