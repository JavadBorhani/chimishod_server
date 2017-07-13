using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Data.QueryProcessors;
using Falcon.Common.Security;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AchievementMaintenanceProcessor : IAchievementMaintenanceProcessor
    {
        private readonly IAchievementQueryProcessor mAchievementQuery;
        private readonly IUsersInquiryProcessor mUserInquiry;
        private readonly IUserSession mUserSession;

        public AchievementMaintenanceProcessor
            (
            IAchievementQueryProcessor AchievementQueryProcessor ,
            IUsersInquiryProcessor UserQuery
            )
        {
            mAchievementQuery = AchievementQueryProcessor;
            mUserInquiry = UserQuery;
        }
        public async Task<SAchievementDic> PrepareAchievementList()
        {
            var outputList = new SAchievementDic();

            var allAchievementList = await mAchievementQuery.GetAllAchievementList();
            var userAchievedAndAchievable = await mAchievementQuery.GetUserAchievedPossetionIds();
            var countTable = await mUserInquiry.GetUserCountInfo(mUserSession.ID);




            return outputList;
        }

    }
}   