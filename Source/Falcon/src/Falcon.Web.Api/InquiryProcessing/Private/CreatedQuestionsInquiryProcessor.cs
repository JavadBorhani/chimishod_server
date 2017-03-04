using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using AutoMapper;
using PagedQuestionDataInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.SNewCreatedQuestions>;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    
    public class CreatedQuestionsInquiryProcessor : ICreatedQuestionsInquiryProcessor
    {
        private readonly IMapper mMapper;
        private readonly ICreatedQuestionsQueryProcessor mQueryProcessor;

        public CreatedQuestionsInquiryProcessor(IMapper Mapper , ICreatedQuestionsQueryProcessor QueryProcessor)
        {
            mMapper = Mapper;
            mQueryProcessor = QueryProcessor;
        }
        public async Task<PagedDataInquiryResponse<SNewCreatedQuestions>> GetQuestionList(PagedDataRequest RequestInfo, int UserID)
        {
            var queryResult = await mQueryProcessor.GetCreatedQuestions(RequestInfo, UserID);

            var questions = queryResult.QueriedItems.ToList();

            var inquiryResponse = new PagedQuestionDataInquiryResponse
            {
                Items = questions,
                PageCount = queryResult.TotalPageCount,
                PageNumber = RequestInfo.PageNumber,
                PageSize = RequestInfo.PageSize
            };

            return inquiryResponse;
        }
    }
}