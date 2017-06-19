// Flapp Copyright 2017-2018

using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using Falcon.EFCommonContext.DbModel;
using Falcon.Common;
using AutoMapper;
using Falcon.Web.Models.Api;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Common.Security;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.InquiryProcessing.Public;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class LeaderBoardController : FalconApiController
    {
        private readonly IUserStatsInquiryProcessor mUserStatsInquiryProcessor;
        private readonly SApplicationState mAppState;
        private readonly IPagedDataRequestFactory mPagedDataRequestFactory;

        public LeaderBoardController(
            IUserStatsInquiryProcessor UserStatsInquiryProcessor , 
            IGlobalApplicationState ApplicationState , 
            IPagedDataRequestFactory PagedDataRequestFactory)
        {
            mUserStatsInquiryProcessor = UserStatsInquiryProcessor;
            mAppState = ApplicationState.GetState();
            mPagedDataRequestFactory = PagedDataRequestFactory;
        }

        [Route("LeaderBoard/{PageNumber}")]
        [HttpPost]
        public async Task<SGlobalRankLeaderBoard> GetLeaderBoardList(int PageNumber)
        {
            var pagedData = mPagedDataRequestFactory.Create(PageNumber, mAppState.Paging_DefaultPageSize);
            var result = await mUserStatsInquiryProcessor.GetLeaderBoard(pagedData);
            return result;
        }
    }
}