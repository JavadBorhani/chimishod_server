﻿// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.EFCommonContext.DbModel;
using AutoMapper;
using Falcon.Web.Models.Api;
using Falcon.Common;
using System.Collections.Generic;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class AchievedPosessionsController : FalconApiController
    {
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;
        private readonly IDbContext mDb;
        private readonly IWebUserSession mUserSession;
        private readonly IGlobalApplicationState mAppState;
        private readonly IAchievementInquiryProcessor mAchievementInquiryProcessor;
        private readonly IUserQueryProcessor mUserQuery;

        private readonly IAchievementMaintenanceProcessor mAchievementMaintenance;

        public AchievedPosessionsController(
            IMapper Mapper , 
            IDateTime DateTime , 
            IDbContext Database , 
            IWebUserSession UserSession , 
            IGlobalApplicationState AppState,
            IAchievementInquiryProcessor AchievementInquiryProcessor , 
            IUserQueryProcessor mUserQueryProcessor , 
            IAchievementMaintenanceProcessor AchievementMaintenanceProcessor)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
            mDb = Database;
            mUserSession = UserSession;
            mAppState = AppState;
            mAchievementInquiryProcessor = AchievementInquiryProcessor;
            mUserQuery = mUserQueryProcessor;
            mAchievementMaintenance = AchievementMaintenanceProcessor; 
        }


        [Route("Achievements/")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<SAchievementDic> PrepareAchievementList()
        {
            var data = await mAchievementMaintenance.PrepareAchievementList();
            return data;
        }

        [ResponseType(typeof(int))]
        [Route("Achievements/Change/{AchievementID}")]
        [HttpPost]
        public async Task<int> ChangeAchievableToAchieved(int AchievementID)
        {
            var coinAmount = await mAchievementMaintenance.AchieveItem(AchievementID);
            return coinAmount;
        }

        [Route("Achievements/Achieved/")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievedList()
        {
            var achievedList = await mDb.Set<AchievedPosession>()
                                                        .AsNoTracking()
                                                        .Include( ap => ap.Achievement)
                                                        .Where( ap => ap.UserID == mUserSession.ID && 
                                                                ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievedID)
                                                        .Select(ap => ap.Achievement)
                                                        .ToListAsync();


            var result = mMapper.Map<List<Achievement>, List<SAchievement>>(achievedList);

            if (result.Count > 0)
                return Response(HttpStatusCode.OK, result);
            else
                return Response(HttpStatusCode.NoContent);
        }

        [Route("Achievements/Achieved/{UserID}")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievedList(int UserID)
        {

            var result = await mAchievementInquiryProcessor.GetAchievementListByUserID(UserID);

            if (result.Count > 0)
                return Response(HttpStatusCode.OK, result);
            else
                return Response(HttpStatusCode.NoContent);
        }

        [Route("Achievements/Achievable/")]
        [ResponseType(typeof(SAchievement))]
        [HttpPost]
        public async Task<IHttpActionResult> GetAchievableList()
        {
            //TODO : It's not working anymore. check out Mapping Configuration 

            var achievableList = await mDb.Set<AchievedPosession>()
                                            .AsNoTracking()
                                            .Include(ap => ap.Achievement)
                                            .Where( ap => ap.UserID == mUserSession.ID &&  
                                                    ap.AchieveStateID == (int)AchievementState.AchievementDefaultAchievableID)
                                            .Select(ap => ap.Achievement)
                                            .ToListAsync();

            var result = mMapper.Map<List<Achievement>, List<SAchievement>>(achievableList); //TODO , replace AchievableIDS

            if (result.Count > 0)
                return Response(HttpStatusCode.OK, result);
            else
                return Response(HttpStatusCode.NoContent);
            
        }
    }
}   