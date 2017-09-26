using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class AnswerInquiryProcessor : IAnswerInquiryProcessor
    {
        public async Task<bool> Answer()
        {
            return false;   
        }
    }
}