using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ICommentsQueryProcessor
    {
        Task<QueryResult<SComment>> GetComments(PagedDataRequest requestInfo , int QuestionID);
        //Temp Test
    }
}
