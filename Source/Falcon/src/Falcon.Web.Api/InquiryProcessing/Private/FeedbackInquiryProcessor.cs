using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models.Api.Feedback;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class FeedbackInquiryProcessor : IFeedbackInquiryProcessor
    {
        private readonly IFeedbackQueryProcessor mFeedbackQuery;
        private readonly IMapper mMapper;

        public FeedbackInquiryProcessor(IFeedbackQueryProcessor FeedbackQuery , IMapper Mapper)
        {
            mFeedbackQuery = FeedbackQuery;
            mMapper = Mapper;
        }
        public async Task<SFeedbackType[]> GetFeedbackTypes()
        {
            var types = await mFeedbackQuery.GetAllTypes();
            
            var data = mMapper.Map<SFeedbackType[]>(types);

            return data;    
        }
    }
}