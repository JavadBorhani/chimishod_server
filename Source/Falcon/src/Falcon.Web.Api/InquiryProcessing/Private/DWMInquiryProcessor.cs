using AutoMapper;
using Falcon.Common;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class DWMInquiryProcessor /*: IDWMInquiryProcessor*/
    {
        private readonly IDWMQueryProcessor mDWMQueryProcessor;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IDateTime mDateTime;
        private readonly IMapper mMapper;
        public DWMInquiryProcessor(IDWMQueryProcessor DWMQueryProcessor , IDateTime DateTime , IUserQueryProcessor UserQueryProcessor , IMapper Mapper)
        {
            mDWMQueryProcessor = DWMQueryProcessor;
            mDateTime = DateTime;
            mUserQueryProcessor = UserQueryProcessor;
            mMapper = Mapper;
        }

        //public async Task<List<SDailyReward>> GetDailyRewardList()
        //{

        //    var dwmCount = await mUserQueryProcessor.GetDWMCount();

        //    if (dwmCount > 0)
        //    {
        //        var ceilDate = mDateTime.Now;
        //        var floorDate = ceilDate.AddDays(dwmCount * -1);

        //        var collectedList = await mDWMQueryProcessor.GetEarnedRewardIds(new SDuration(floorDate, ceilDate));
        //        var totalList = await mDWMQueryProcessor.GetAllRewards();

        //        var list = new List<SDailyReward>();
        //        list.Capacity = totalList.Length;

        //        for (int i = 0; i < totalList.Length; ++i)
        //        {
        //            if (collectedList.Contains(totalList[i].ID))
        //            {
        //                list.Add(new SDailyReward
        //                {
        //                    ID = totalList[i].ID,
        //                    Name = totalList[i].Name,
        //                    Day = totalList[i].Day,
        //                    Icon = totalList[i].Icon,
        //                    Prize = totalList[i].Prize,
        //                    State = DailyRewardState.Collected
        //                });

        //                collectedList.Remove(totalList[i].ID);
        //            }
        //            else if (totalList[i].Day <= dwmCount)
        //            {
        //                list.Add(new SDailyReward
        //                {
        //                    ID = totalList[i].ID,
        //                    Name = totalList[i].Name,
        //                    Day = totalList[i].Day,
        //                    Icon = totalList[i].Icon,
        //                    Prize = totalList[i].Prize,
        //                    State = DailyRewardState.Collectible
        //                });
        //            }
        //            else
        //            {
        //                list.Add(new SDailyReward
        //                {
        //                    ID = totalList[i].ID,
        //                    Name = totalList[i].Name,
        //                    Day = totalList[i].Day,
        //                    Icon = totalList[i].Icon,
        //                    Prize = totalList[i].Prize,
        //                    State = DailyRewardState.NotCollectible
        //                });
        //            }
        //        }
        //        return list;
        //    }
        //    else
        //    {
        //        var totalList = await mDWMQueryProcessor.GetAllRewards();
        //        var notCollectibles = mMapper.Map<List<SDailyReward>>(totalList);
        //        return notCollectibles;
        //    }
        //}
    }
}