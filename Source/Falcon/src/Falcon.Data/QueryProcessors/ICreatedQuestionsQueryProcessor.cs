using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api;
using Falcon.Web.Models.Api.Input.Questions;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface ICreatedQuestionsQueryProcessor
    {
        Task<QueryResult<SNewCreatedQuestions>> GetCreatedQuestions(PagedDataRequest requestInfo, int UserID);
        Task<bool> IsDeletable(int QuestionID);
        Task<bool> IsEditable(int QuestionID);
        Task<bool> Delete(int QuestionID);
        Task<bool> Edit(EditInfo Info); 
    }
}
