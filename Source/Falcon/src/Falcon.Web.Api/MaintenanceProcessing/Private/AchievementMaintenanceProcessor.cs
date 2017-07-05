using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Data.QueryProcessors;


namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class AchievementMaintenanceProcessor : IAchievementMaintenanceProcessor
    {
        private readonly IAchievementInquiryProcessor mAchievementInqiury;
        private readonly IAchievementQueryProcessor mAchievementQuery;
        public AchievementMaintenanceProcessor
            (
            IAchievementInquiryProcessor AchievementInquiryProcessor , 
            IAchievementQueryProcessor AchievementQueryProcessor
            )
        {
            mAchievementInqiury = AchievementInquiryProcessor;
            mAchievementQuery = AchievementQueryProcessor;

        }
        public async Task<AchievementList> PrepareAchievementList()
        {
            var outputList = new AchievementList();


            return outputList;
        }
    }
}   