using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Database.SqlServer.QueryProcessors;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Falcon.Web.Api.MaintenanceProcessing.Private
{
    public class CodeGiftsMaintenanceProcessor : ICodeGiftsMaintenanceProcessor
    {

        private readonly ICodeGiftsQueryProcessor mCodeGiftsQueryProcessor;
        private readonly IUserQueryProcessor mUserQueryProcessor;
        private readonly IMapper mMapper;

        public CodeGiftsMaintenanceProcessor(ICodeGiftsQueryProcessor CodeGiftsQueryProcessor, IUserQueryProcessor UserQueryProcessor, IMapper Mapper)
        {
            mCodeGiftsQueryProcessor = CodeGiftsQueryProcessor;
            mUserQueryProcessor = UserQueryProcessor;
            mMapper = Mapper;
        }
        public async Task<SCodeGift> RegisterGiftCodePrize(int GiftCodeID)
        {
            SCodeGift result = new SCodeGift();
            var exists = await mCodeGiftsQueryProcessor.Exists(GiftCodeID);
            if(exists)
            {
                var registered = await mCodeGiftsQueryProcessor.Registered(GiftCodeID);
                if (!registered)
                {
                    var expired = await mCodeGiftsQueryProcessor.IsExpired(GiftCodeID);
                    if (!expired)
                    {
                        var codeGiftAdded = await mCodeGiftsQueryProcessor.AddByID(GiftCodeID);
                        if (codeGiftAdded)
                        {
                            var codeGift = await mCodeGiftsQueryProcessor.GetByID(GiftCodeID);
                            var totalCoin = await mUserQueryProcessor.AddCoin(codeGift.Prize);

                            result.ID = GiftCodeID;
                            result.TotalCoin = totalCoin;
                            result.ResponseCode = ResponseState.Ok;
                            return result;
                        }
                    }
                    else
                    {
                        result.ResponseCode = ResponseState.IsExpired;
                    }
                }
                else
                {
                    result.ResponseCode = ResponseState.HasGot;
                }
            }
            else
            {
                result.ResponseCode = ResponseState.NotExists;
            }
            
            return result;
        }
    }
}
