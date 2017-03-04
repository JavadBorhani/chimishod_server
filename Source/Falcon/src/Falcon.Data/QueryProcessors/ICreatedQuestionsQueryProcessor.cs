using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ICreatedQuestionsQueryProcessor
    {
        Task<QueryResult<SNewCreatedQuestions>> GetCreatedQuestions(PagedDataRequest requestInfo, int UserID);
    }
}
