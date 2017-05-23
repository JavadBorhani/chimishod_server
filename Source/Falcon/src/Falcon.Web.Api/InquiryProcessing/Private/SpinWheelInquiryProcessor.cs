using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using Falcon.Common;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class SpinWheelInquiryProcessor : ISpinWheelInquiryProcessor
    {

        private readonly ISpinWheelQueryProcessor mSpinWheelQueryProcessor;
        private readonly IDateTime mDateTime;
        private readonly IUserQueryProcessor mUserQueryProcessor; 
        public SpinWheelInquiryProcessor(IDateTime DateTime , ISpinWheelQueryProcessor SpinWheelQueryProcessor , IUserQueryProcessor UserQueryProcessor)
        {
            mDateTime = DateTime;
            mSpinWheelQueryProcessor = SpinWheelQueryProcessor;
            mUserQueryProcessor = UserQueryProcessor;
        }
        public async Task<List<SSpinWheel>> GetSpinWheelList()
        {
            throw new NotImplementedException();
        }
    }
}