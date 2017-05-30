using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Falcon.Web.Models.Api;
using Falcon.Data.QueryProcessors;
using AutoMapper;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class UserStatsInquiryProcessor : IUserStatsInquiryProcessor
    {
        private readonly IUserStatQueryProcessor mUserStatQueryProcessor;
        private readonly IMapper mMapper;

        public UserStatsInquiryProcessor(IUserStatQueryProcessor UserStatQueryProcessor , IMapper Mapper)
        {
            mUserStatQueryProcessor = UserStatQueryProcessor;
            mMapper = Mapper;
        }

       
        public async Task<SUserStat> GetByID(int ID)
        {
            var item = await mUserStatQueryProcessor.GetById(ID);
            return mMapper.Map<SUserStat>(item);
        }
    }
}
