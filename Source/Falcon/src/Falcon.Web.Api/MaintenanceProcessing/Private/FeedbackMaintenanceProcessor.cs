using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api.Feedback;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class FeedbackMaintenanceProcessor : IFeedbackMaintenanceProcessor
    {
        private readonly IFeedbackQueryProcessor mFeedbackQuery;
        public FeedbackMaintenanceProcessor(IFeedbackQueryProcessor FeedbackQuery)
        {
            mFeedbackQuery = FeedbackQuery;
        }
        public async Task<bool> SaveFeedback(SFeedback Inquiry)
        {
            var response = await mFeedbackQuery.SaveFeedback(Inquiry);
            return response;
        }
    }
}