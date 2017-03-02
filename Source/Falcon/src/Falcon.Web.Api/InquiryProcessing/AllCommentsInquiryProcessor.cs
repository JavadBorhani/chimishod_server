using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Data;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Models;
using Falcon.Data.QueryProcessors;
using PagedTaskDataInquiryResponse =
    Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.SComment>;
using AutoMapper;
using Falcon.Web.Models.Api;

namespace Falcon.Web.Api.InquiryProcessing
{
    public class AllCommentsInquiryProcessor : IAllCommentsInquiryProcessor
    {
        
        private readonly IAllCommentsQueryProcessor mQueryProcessor;
        private readonly IMapper mMapper;

        public AllCommentsInquiryProcessor(IAllCommentsQueryProcessor queryProcessor , IMapper Mapper)
        {
            mQueryProcessor = queryProcessor;
            mMapper = Mapper;
        }
        public PagedDataInquiryResponse<SComment> GetComments(PagedDataRequest requestInfo)
        {
            //TODO : change logic of this 
            var queryResult = mQueryProcessor.GetComments(requestInfo);

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