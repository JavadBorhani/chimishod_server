using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class DWMInquiryProcessor : IDWMInquiryProcessor
    {
        private readonly IDWMQueryProcessor mDWMQueryProcessor;
        public DWMInquiryProcessor(IDWMQueryProcessor DWMQueryProcessor)
        {
            mDWMQueryProcessor = DWMQueryProcessor;
        }
    }
}