using AutoMapper;
using Falcon.Common;
using Falcon.Data.QueryProcessors;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class SpinWheelInquiryProcessor /*: ISpinWheelInquiryProcessor*/
    {

        private readonly ISpinWheelQueryProcessor mSpinWheelQueryProcessor;
        private readonly IDateTime mDateTime;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IMapper mMapper;
        public SpinWheelInquiryProcessor(IDateTime DateTime , IMapper Mapper, ISpinWheelQueryProcessor SpinWheelQueryProcessor , IUserQueryProcessor UserQueryProcessor)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
            mSpinWheelQueryProcessor = SpinWheelQueryProcessor;
            mUserQueryProcessor = UserQueryProcessor;
        }
        //public async Task<List<SSpinWheel>> GetSpinWheelList()
        //{
        //    var spinList = new List<SpinWheel>();

        //    var totalList = await mSpinWheelQueryProcessor.GetAllSpinWheels();

        //    var unrepetables = await mSpinWheelQueryProcessor.GetAllAchievedUnrepeatableItemIds();

        //    if(totalList.Count > 0 )
        //    {
        //        spinList.AddRange(totalList.Take(Constants.SpinWheel.NumberOfSlots).ToList());

        //        var tempItems = spinList.Where(s => s.SpinWheelAlternativeID != null).ToList();

        //        for (int i = 0; i < tempItems.Count; ++i)
        //        {
        //            var firstLeaf = totalList.Where(t => t.ID == tempItems[i].SpinWheelAlternativeID).FirstOrDefault();                     
        //            firstLeaf.Priority = tempItems[i].Priority;
        //            firstLeaf.FirstChance = tempItems[i].FirstChance;
        //            firstLeaf.SecondChance = tempItems[i].SecondChance;

        //                spinList.Add(firstLeaf);

        //            if (firstLeaf.SpinWheelAlternativeID != null)
        //            {
        //                var secondLeaf = totalList.Where(t => t.ID == firstLeaf.SpinWheelAlternativeID).FirstOrDefault();
        //                secondLeaf.Priority = tempItems[i].Priority;
        //                secondLeaf.FirstChance = tempItems[i].FirstChance;
        //                secondLeaf.SecondChance = tempItems[i].SecondChance;

        //                spinList.Add(secondLeaf);
        //            }
        //            if(unrepetables.Contains(tempItems[i].ID))
        //            {
        //                spinList[spinList.IndexOf(tempItems[i])] = firstLeaf;
        //            }
        //        }

        //        if (spinList.Count < Constants.SpinWheel.NumberOfSlots)
        //        {
        //            var blankItem = totalList.Where(t => t.SpinWheelType.Title == Enum.GetName(typeof(SSpinWheelType), SSpinWheelType.Blank)).FirstOrDefault();
        //            if(blankItem != null)
        //            {
        //                int remainedItems = Constants.SpinWheel.NumberOfSlots - spinList.Count;
        //                spinList.AddRange(Enumerable.Repeat(blankItem, remainedItems));
        //            }
        //        }

        //        return mMapper.Map<List<SSpinWheel>>(spinList);
        //    }
        //    return null;    
        //}
    }
}