using System.Collections.Generic;
using System.Linq;
using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Data.QueryProcessors;

using AutoMapper;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    using System.Threading.Tasks;
    using PagedTaskDataInquiryResponse = PagedDataInquiryResponse<SComment>;

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

            var outputComments = mMapper.Map<List<SComment>>(comments);

            var inquiryResponse = new PagedTaskDataInquiryResponse
            {
                Items = outputComments,
                PageCount = queryResult.TotalPageCount,
                PageNumber = requestInfo.PageNumber,
                PageSize = requestInfo.PageSize
            };

            return inquiryResponse;

        }
    }
}