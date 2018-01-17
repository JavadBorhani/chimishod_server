// Flapp Copyright 2017-2018

using AutoMapper;
using Falcon.Common;
using Falcon.Web.Api.InquiryProcessing.Public;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Common;
using Falcon.Web.Models.Api;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace Falcon.Web.Api.Controllers.V2
{
    [UnitOfWorkActionFilter]
    public class StoresController : FalconApiController
    {
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;
        private readonly IGlobalApplicationState mAppState;
        private readonly IStoresMaintenanceProcessor mStoreMaintenanceProcessor;
        private readonly IStoresInquiryProcessor mStoreInquiryProcessor;

        public StoresController(IMapper Mapper , 
            IDateTime DateTime, 
            
            IGlobalApplicationState AppState, 
            IStoresMaintenanceProcessor StoresMaintenanceProcessor , 
            IStoresInquiryProcessor StoresInquiryProcessor)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
            mAppState = AppState;
            mStoreMaintenanceProcessor = StoresMaintenanceProcessor;
            mStoreInquiryProcessor = StoresInquiryProcessor; 
        }

        [ResponseType(typeof(SStore))]
        [Route("v2/Stores/{StoreKey}")]
        [HttpPost]
        public async Task<IHttpActionResult> GetStoreList(int StoreKey)
        {
            // TODO : remember to remove this 
            // mAppState.State().Store_DefaultReturnAmount; 

            var result = await mStoreInquiryProcessor.GetStoreList(StoreKey);
            
            if(result != null)
                return Ok(result);
            else
                return Response(HttpStatusCode.NoContent);
        }
        
        [ResponseType(typeof(SHardCurrencyPurchasedVerification))]
        [HttpPost]
        [Route("v2/Stores/ValidatePurchase")]
        public async Task<SHardCurrencyPurchasedVerification> PurchaseHardCurrency(SHardCurrency HardCurrency)
        {

            if (!ModelState.IsValid || HardCurrency.StoreItemID <= 0)
                return null;
             var result = await mStoreMaintenanceProcessor.VerifyPurchase(HardCurrency);

            return result;
        }

    }
}