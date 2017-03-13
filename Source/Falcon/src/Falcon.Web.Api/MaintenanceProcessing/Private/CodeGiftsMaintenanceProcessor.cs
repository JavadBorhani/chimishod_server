using AutoMapper;
using Falcon.Data.QueryProcessors;
using Falcon.Database.SqlServer.QueryProcessors;
using Falcon.EFCommonContext.DbModel;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Models.Api;
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

        public async Task<SCodeGift> RegisterGiftCodePrize(string GiftCodeSerial)
        {
            SCodeGift result = new SCodeGift();
            CodeGift codeGift = await mCodeGiftsQueryProcessor.ReturnIfExists(GiftCodeSerial);

            if (codeGift != null)
            {
                var registered = await mCodeGiftsQueryProcessor.Registered(codeGift.ID);
                if (!registered)
                {
                    var expired = await mCodeGiftsQueryProcessor.IsExpired(codeGift.ID);
                    if (!expired)
                    {
                        var codeGiftAdded = await mCodeGiftsQueryProcessor.AddByID(codeGift.ID);
                        if (codeGiftAdded)
                        {
                            var totalCoin = await mUserQueryProcessor.AddCoin(codeGift.Prize);

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
