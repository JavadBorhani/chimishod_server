using Falcon.Data;
using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Models;
using Falcon.Web.Models.Api.Friend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PagedInboxWithAnswerInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.Friend.SQuestionWithAnswerState>;
using PagedSentWithAnswerInquiryResponse = Falcon.Web.Models.PagedDataInquiryResponse<Falcon.Web.Models.Api.Friend.SQuestionWithAnswerState>;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class SentInquiryProcessor : ISentInquiryProcessor
    {
        private readonly ISentQueryProcessor mSentQuery;

        public SentInquiryProcessor (ISentQueryProcessor SentQueryProcessor)
        {
            mSentQuery = SentQueryProcessor;
        }

        public async Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetUserInboxMessageList(PagedDataRequest RequestInfo)
        {
            var queryResult = await mSentQuery.GetUserInboxMessages(RequestInfo);

            var items = queryResult.QueriedItems.ToList();

            var inquiryResponse = new PagedInboxWithAnswerInquiryResponse
            {
                Items = items,
                PageCount = queryResult.TotalPageCount,
                PageNumber = RequestInfo.PageNumber,
                PageSize = RequestInfo.PageSize
            };

            return inquiryResponse;
        }

        public async Task<List<SQuestionWithAnswerState>> GetUserInboxFromDateUpToNow(DateTime DateTime)
        {
            var inboxQuestions = await mSentQuery.GetUserInboxMessageFromDateUpToNow(DateTime);

            return inboxQuestions;
        }

        public async Task<PagedDataInquiryResponse<SQuestionWithAnswerState>> GetUserSentMessageList(PagedDataRequest RequestInfo)
        {
            var queryResult = await mSentQuery.GetUserSentMessages(RequestInfo);

            var items = queryResult.QueriedItems.ToList();

            var inquiryResponse = new PagedSentWithAnswerInquiryResponse
            {
                Items = items,
                PageCount = queryResult.TotalPageCount,
                PageNumber = RequestInfo.PageNumber,
                PageSize = RequestInfo.PageSize
            };

            return inquiryResponse;
        }

    }
}