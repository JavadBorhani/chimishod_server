// Flapp Copyright 2017-2018

using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Falcon.Common;
using AutoMapper;
using Falcon.Web.Models.Api;
using Falcon.Web.Common;
using Falcon.EFCommonContext;
using Falcon.Web.Api.Utilities.Base;
using Falcon.Web.Api.MaintenanceProcessing.Public;
using Falcon.Web.Api.InquiryProcessing.Public;

namespace Falcon.Web.Api.Controllers.V1
{
    [UnitOfWorkActionFilter]
    public class StoresController : FalconApiController
    {
        private readonly IDbContext mDb;
        private readonly IMapper mMapper;
        private readonly IDateTime mDateTime;
        private readonly IGlobalApplicationState mAppState;
        private readonly IStoresMaintenanceProcessor mStoreMaintenanceProcessor;
        private readonly IStoresInquiryProcessor mStoreInquiryProcessor;

        public StoresController(IMapper Mapper , 
            IDateTime DateTime, 
            IDbContext Database , 
            IGlobalApplicationState AppState, 
            IStoresMaintenanceProcessor StoresMaintenanceProcessor , 
            IStoresInquiryProcessor StoresInquiryProcessor)
        {
            mMapper = Mapper;
            mDateTime = DateTime;
            mDb = Database;
            mAppState = AppState;
            mStoreMaintenanceProcessor = StoresMaintenanceProcessor;
            mStoreInquiryProcessor = StoresInquiryProcessor; 
        }

        [ResponseType(typeof(SStore))]
        [Route("Stores/{StoreKey}")]
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
        [Route("Stores/ValidatePurchase")]
        public async Task<SHardCurrencyPurchasedVerification> PurchaseHardCurrency(SHardCurrency HardCurrency)
        {

            if (!ModelState.IsValid || HardCurrency.StoreItemID <= 0)
                return null;
             var result = await mStoreMaintenanceProcessor.VerifyPurchase(HardCurrency);

            return result;
        }

    }
}