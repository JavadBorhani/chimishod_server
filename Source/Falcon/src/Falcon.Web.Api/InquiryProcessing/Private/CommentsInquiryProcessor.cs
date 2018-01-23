using AutoMapper;
using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using System.Linq;
using System.Threading.Tasks;
using PagedTaskDataInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.SComment>;

namespace Falcon.Web.Api.InquiryProcessing.Private
{

    public class CommentsInquiryProcessor : ICommentsInquiryProcessor
    {
        
        private readonly ICommentsQueryProcessor mQueryProcessor;
        private readonly IMapper mMapper;

        public CommentsInquiryProcessor(ICommentsQueryProcessor queryProcessor , IMapper Mapper)
        {
            mQueryProcessor = queryProcessor;
            mMapper = Mapper;
        }
        public async Task<PagedDataInquiryResponse<SComment>> GetComments(PagedDataRequest requestInfo , int QuestionID)
        {

            //TODO : change logic of this 
            var queryResult = await mQueryProcessor.GetComments(requestInfo , QuestionID);

            var comments = queryResult.QueriedItems.ToList();

            var inquiryResponse = new PagedTaskDataInquiryResponse
            {
                Items = comments,
                PageCount = queryResult.TotalPageCount,
                PageNumber = requestInfo.PageNumber,
                PageSize = requestInfo.PageSize
            };

            return inquiryResponse;

        }
    }
}