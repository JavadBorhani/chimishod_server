using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Feedback;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IFeedbackQueryProcessor
    {
        Task<FeedbackType[]> GetAllTypes();
        Task<bool> SaveFeedback(SFeedback inquiry);
    }
}
