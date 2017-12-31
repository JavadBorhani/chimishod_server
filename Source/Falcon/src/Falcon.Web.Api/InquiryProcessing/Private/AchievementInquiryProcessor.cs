using AutoMapper;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class AchievementInquiryProcessor /*: IAchievementInquiryProcessor*/
    {
        private readonly IAchievementQueryProcessor mAchievementQueryProcessor;
        private readonly IMapper mMapper;
        public AchievementInquiryProcessor(IAchievementQueryProcessor AchievementQueryProcessor , IMapper Mapper)
        {
            mAchievementQueryProcessor = AchievementQueryProcessor;
            mMapper = Mapper;
        }

        //public async Task<List<SAchievement>> GetAchievementListByUserID(int UserID)
        //{
        //    var achievedList = await mAchievementQueryProcessor.GetUserAchievements(UserID);

        //    var results = mMapper.Map<List<SAchievement>>(achievedList);

        //    return results;
        //}
    }
}