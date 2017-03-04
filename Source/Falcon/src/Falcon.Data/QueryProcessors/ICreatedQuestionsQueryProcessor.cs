using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ICreatedQuestionsQueryProcessor
    {
        Task<QueryResult<SCreatedQuestion>> GetCreatedQuestions(PagedDataRequest requestInfo, int UserID);
    }
}
