using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models.Api.Report;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestionReportQueryProcessor
    {
        Task<ReportType[]> GetReportTypeList();
        Task<bool> ReportQuestion(SReportedQuestion ReportedQuestion);
    }
}
