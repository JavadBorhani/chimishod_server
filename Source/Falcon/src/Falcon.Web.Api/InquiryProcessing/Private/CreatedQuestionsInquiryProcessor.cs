using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using AutoMapper;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class CreatedQuestionsInquiryProcessor : ICreatedQuestionsInquiryProcessor
    {
        private readonly IMapper mMapper;
        private readonly ICreatedQuestionsInquiryProcessor mQueryProcessor;

        public CreatedQuestionsInquiryProcessor(IMapper Mapper , ICreatedQuestionsInquiryProcessor QueryProcessor)
        {
            mMapper = Mapper;
            mQueryProcessor = QueryProcessor;
        }
        public Task<PagedDataInquiryResponse<SCreatedQuestion>> GetQuestionList(PagedDataRequest RequestInfo, int UserID)
        {
            return null;
        }
    }
}