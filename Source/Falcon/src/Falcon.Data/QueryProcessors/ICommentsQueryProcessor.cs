using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ICommentsQueryProcessor
    {
        Task<QueryResult<Comment>> GetComments(PagedDataRequest requestInfo);
    }
}
