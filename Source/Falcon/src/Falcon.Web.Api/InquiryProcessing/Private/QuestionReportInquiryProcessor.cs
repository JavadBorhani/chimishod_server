using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class QuestionReportInquiryProcessor : IQuestionReportInquiryProcessor
    {
        private readonly IQuestionReportQueryProcessor mReportQuery;
        private readonly IMapper mMapper;
        public QuestionReportInquiryProcessor(IQuestionReportQueryProcessor ReportQuery , IMapper Mapper)
        {
            mReportQuery = ReportQuery;
            mMapper = Mapper;
        }
        public async Task<SReportType[]> GetReportList()
        {
            var query = await mReportQuery.GetReportTypeList();
            var data = mMapper.Map<SReportType[]>(query);
            return data;
        }
    }
}