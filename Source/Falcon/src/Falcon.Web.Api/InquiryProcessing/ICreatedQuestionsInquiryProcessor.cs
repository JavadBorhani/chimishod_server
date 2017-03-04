using Falcon.Data;
using Falcon.Web.Models;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing
{
    public interface ICreatedQuestionsInquiryProcessor
    {
        Task<PagedDataInquiryResponse<SCreatedQuestion>> GetQuestionList(PagedDataRequest RequestInfo, int UserID);
    }
}
