// Flapp Copyright 2017-2018
using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Public
{
    public interface ICreatedQuestionsInquiryProcessor
    {
        Task<PagedDataInquiryResponse<SNewCreatedQuestions>> GetQuestionList(PagedDataRequest RequestInfo, int UserID);
    }
}
