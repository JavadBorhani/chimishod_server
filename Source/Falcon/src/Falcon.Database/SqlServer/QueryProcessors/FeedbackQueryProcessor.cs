using Falcon.Common;
using Falcon.Common.Security;
using Falcon.Data.QueryProcessors;
using Falcon.EFCommonContext;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Feedback;
using System.Data.Entity;
using System.Threading.Tasks;

namespace Falcon.Database.SqlServer.QueryProcessors
{
    public class FeedbackQueryProcessor : IFeedbackQueryProcessor
    {
        private readonly IDbContext mDb;
        private readonly IDateTime mDateTime;
        private readonly IUserSession mUserSession;
        public FeedbackQueryProcessor(IDbContext Database , IDateTime DateTime , IUserSession UserSession)
        {
            mDb = Database;
            mDateTime = DateTime;
            mUserSession = UserSession;
        }
        public async Task<FeedbackType[]> GetAllTypes()
        {
            var types = await mDb.Set<FeedbackType>().AsNoTracking().ToArrayAsync();
            return types;   
        }

        public async Task<bool> SaveFeedback(SFeedback Inquiry)
        {
            var feedback = new Feedback
            {
                FeedbackTypeID = Inquiry.FeedbackTypeID,
                CreatedDate = mDateTime.Now,
                UpdatedDate = mDateTime.Now,
                UserID = mUserSession.ID,
                Message = Inquiry.Message
            };

            mDb.Set<Feedback>().Add(feedback);

            try
            {
                await mDb.SaveChangesAsync();

                return true;
            }
            catch
            {
                throw new BusinessRuleViolationException("Feedback Information is not correct" + mUserSession.ID);
            }

        }
    }
}
