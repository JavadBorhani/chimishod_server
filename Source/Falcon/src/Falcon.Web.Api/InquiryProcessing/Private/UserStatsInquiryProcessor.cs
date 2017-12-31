using AutoMapper;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class UserStatsInquiryProcessor /*: IUserStatsInquiryProcessor*/
    {
        private readonly IUserStatQueryProcessor mUserStatQueryProcessor;
        private readonly IMapper mMapper;

        public UserStatsInquiryProcessor(IUserStatQueryProcessor UserStatQueryProcessor , IMapper Mapper)
        {
            mUserStatQueryProcessor = UserStatQueryProcessor;
            mMapper = Mapper;
        }

       
        //public async Task<SUserStat> GetStatusByID(int ID)
        //{
        //    var item = await mUserStatQueryProcessor.GetById(ID);
        //    return mMapper.Map<SUserStat>(item);
        //}

        //public async Task<SGlobalRankLeaderBoard> GetLeaderBoard(PagedDataRequest RequestInfo)
        //{
        //    //TODO : change logic of this 
        //    var queryResult = await mUserStatQueryProcessor.GetLeaderBoard(RequestInfo);

        //    var leaderboards = queryResult.QueriedItems.ToList();

        //    var inquiryResponse = new PagedLeaderBoardInquiryResponse
        //    {
        //        Items = leaderboards,
        //        PageCount = queryResult.TotalPageCount,
        //        PageNumber = RequestInfo.PageNumber,
        //        PageSize = RequestInfo.PageSize
        //    };
        //    var data = new SGlobalRankLeaderBoard
        //    {
        //        Players = inquiryResponse,
        //        User = null
        //    };

        //    if (RequestInfo.PageNumber == Constants.DefaultValues.FirstPageNumer)
        //    {
        //        data.User = await mUserStatQueryProcessor.GetUserLeaderBoard();
        //    }

        //    return data;
        //}
    }
}
