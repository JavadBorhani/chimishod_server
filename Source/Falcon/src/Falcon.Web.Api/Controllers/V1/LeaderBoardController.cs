// Flapp Copyright 2017-2018

using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using System.Web.Http;

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