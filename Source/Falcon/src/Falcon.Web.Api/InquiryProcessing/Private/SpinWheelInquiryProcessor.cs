using Falcon.Web.Api.InquiryProcessing.Public;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Falcon.Web.Models.Api;
using System.Threading.Tasks;
using Falcon.Data.QueryProcessors;
using Falcon.Common;
using AutoMapper;
using Falcon.EFCommonContext.DbModel;

namespace Falcon.Web.Api.InquiryProcessing.Private
{
    public class SpinWheelInquiryProcessor : ISpinWheelInquiryProcessor
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
        public async Task<List<SSpinWheel>> GetSpinWheelList()
        {
            var spinList = new List<SpinWheel>();

            var totalList = await mSpinWheelQueryProcessor.GetAllSpinWheelsWithoutAchieved();
            if(totalList.Count > 0 )
            {
                spinList.AddRange(totalList.Take(Constants.SpinWheel.NumberOfSlots).ToList());

                var tempItems = spinList.Where(s => s.SpinWheelAlternativeID != null).ToList();

                for (int i = 0; i < tempItems.Count; ++i)
                {
                    var firstLeaf = totalList.Where(t => t.ID == tempItems[i].SpinWheelAlternativeID).SingleOrDefault();
                    if(!spinList.Any(s => s.ID == firstLeaf.ID))
                        spinList.Add(firstLeaf);

                    if (firstLeaf.SpinWheelAlternativeID != null)
                    {
                        var secondLeaf = totalList.Where(t => t.ID == firstLeaf.SpinWheelAlternativeID).SingleOrDefault();
                        if(!spinList.Any(s => s.ID == secondLeaf.ID))
                            spinList.Add(secondLeaf);
                    }
                }

                if (spinList.Count < Constants.SpinWheel.NumberOfSlots)
                {
                    var blankItem = totalList.Where(t => t.SpinWheelType.Title == Enum.GetName(typeof(SSpinWheelType), SSpinWheelType.Blank)).SingleOrDefault();
                    if(blankItem != null)
                    {
                        int remainedItems = Constants.SpinWheel.NumberOfSlots - spinList.Count;
                        spinList.AddRange(Enumerable.Repeat(blankItem, remainedItems));
                    }
                }

                return mMapper.Map<List<SSpinWheel>>(spinList);
            }
            return null;    
        }
    }
}