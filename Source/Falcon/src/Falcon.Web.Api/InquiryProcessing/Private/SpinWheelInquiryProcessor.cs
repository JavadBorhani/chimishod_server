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
                    var newitem = totalList.Where(t => t.ID == tempItems[i].ID).SingleOrDefault();
                    spinList.Add(newitem);

                    if (newitem.SpinWheelAlternativeID != null)
                    {
                        spinList.Add(totalList.Where(t => t.ID == newitem.SpinWheelAlternativeID).SingleOrDefault());
                    }
                }

                if (spinList.Count < Constants.SpinWheel.NumberOfSlots)
                {
                    var blankItem = totalList.Where(t => t.SpinWheelType.Title == Enum.GetName(typeof(SSpinWheelType), SSpinWheelType.Blank)).SingleOrDefault();
                    int remainedItems = Constants.SpinWheel.NumberOfSlots - spinList.Count;
                    spinList.AddRange(Enumerable.Repeat(blankItem, remainedItems));
                }

                return mMapper.Map<List<SSpinWheel>>(spinList);
            }
            return null;    
        }
    }
}