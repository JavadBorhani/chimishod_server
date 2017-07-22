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
        private readonly ICategoriesQueryProcessor mCategoriesQueryProcessor;

        public AchievementMaintenanceProcessor
            (
            IAchievementQueryProcessor AchievementQueryProcessor ,
            IUsersInquiryProcessor UserQuery,
            IUserSession UserSession,
            ICategoriesQueryProcessor CategoriesQueryProcessor
            )
        {
            mAchievementQuery = AchievementQueryProcessor;
            mUserInquiry = UserQuery;
            mUserSession = UserSession;
            mCategoriesQueryProcessor = CategoriesQueryProcessor;
        }
        public async Task<SAchievementDic> PrepareAchievementList()
        {
            var outputList = new SAchievementDic();

            var allAchievementList = await mAchievementQuery.GetAllAchievementWithUserState(mUserSession.ID);

            var userStatRecord = await mAchievementQuery.GetUserAchievementStats(mUserSession.ID);

            var userAnswerCount = await mCategoriesQueryProcessor.GetUserAnswerCount(mUserSession.ID);

            

            

            return outputList;
        }



    }
}   