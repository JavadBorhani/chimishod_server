using Falcon.Common;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.Web.Models.Api;
using System;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class QuestionSelectorQueryProcessor : IQuestionSelectorQueryProcessor
    {

        private readonly IDateTime mDateTime;
        private readonly IDbContext mDb;

        public QuestionSelectorQueryProcessor(IDateTime DateTime , IDbContext Database)
        {
            mDateTime = DateTime;
            mDb = Database;
        }
        public async Task<SQuestion> GetActionBaseQuestions(int Amount)
        {
            throw new NotImplementedException();
        }

        public async Task<SQuestion> GetBoostedQuestions(int Amount)
        {
                        
            throw new NotImplementedException();
        }

        public async Task<SQuestion> GetCreatedQuestions(int Amount)
        {
            throw new NotImplementedException();
        }

        public async Task<SQuestion> GetVerifiedQuestions(int Amount)
        {
            throw new NotImplementedException();
        }
    }
}
