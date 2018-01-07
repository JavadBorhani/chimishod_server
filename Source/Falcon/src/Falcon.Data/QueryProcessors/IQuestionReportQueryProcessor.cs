using Falcon.EFCommonContext.DbModel;
using System.Threading.Tasks;

namespace Falcon.Data.QueryProcessors
{
    public interface IQuestionReportQueryProcessor
    {
        Task<ReportType[]> GetReportTypeList();
        Task<int> GetReportCountByQuestionID(int QuestionID);
    }
}
