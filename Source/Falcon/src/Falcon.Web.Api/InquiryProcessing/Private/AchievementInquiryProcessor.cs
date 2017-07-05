using Falcon.Data.QueryProcessors;
using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using AutoMapper;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class AchievementInquiryProcessor : IAchievementInquiryProcessor
    {
        private readonly IAchievementQueryProcessor mAchievementQueryProcessor;
        private readonly IMapper mMapper;
        public AchievementInquiryProcessor(IAchievementQueryProcessor AchievementQueryProcessor , IMapper Mapper)
        {
            mAchievementQueryProcessor = AchievementQueryProcessor;
            mMapper = Mapper;
        }

        public async Task<List<SAchievement>> GetAchievementListByUserID(int UserID)
        {
            var achievedList = await mAchievementQueryProcessor.GetUserAchievementList(UserID);

            var results = mMapper.Map<List<SAchievement>>(achievedList);

            return results;
        }
    }
}